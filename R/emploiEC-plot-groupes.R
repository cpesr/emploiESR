
emploisEC_groupe <- function(groupeID, grandedisciplineID) {
  sectionsID <- cnu.sections %>% filter(GroupeCNU.ID == groupeID) %>% pull(SectionCNU.ID)
  bind_rows(
    emploisEC %>% filter(Périmètre == "Section", Périmètre.ID %in% sectionsID),
    #emploisEC %>% filter(Périmètre == "Grande discipline", Périmètre.ID == grandedisciplineID),
    emploisEC %>% filter(Périmètre == "Groupe", Périmètre.ID == groupeID))
    #emploisEC %>% filter(Périmètre == "Ensemble", Périmètre.ID == "Ensemble")) 
}


hacklabels <- function(x) {
  ifelse(x<1.9 & x!=0,
         scales::percent(x, accuracy = 1),
         round(x))
}

labeller_100 <- function(x)  paste(x, "(base 100)")


plot_all_groupe <- function(groupeID, grandedisciplineID, metriques,
                             labs, norm=FALSE, labels=TRUE, sizemult=1, percentlab=FALSE, zeroing=TRUE,
                             facet_nrow=NULL, colors = NULL) {
  
  labellerfun <- ifelse(norm,labeller_100,identity)
  
  emploisEC_groupe(groupeID, grandedisciplineID) %>%
    pivot_longer(
      cols = all_of(metriques),
      names_to = "Métrique",
      values_to = "val"
    ) %>% 
    mutate(Métrique = factor(Métrique, levels=metriques, labels=labs)) %>%
    mutate(seclab = ifelse(Périmètre == "Section" & Année == last(Année),
                           as.character(Périmètre.ID), NA)) %>%
      { if(norm)
      group_by(., Périmètre, Périmètre.ID, Métrique) %>% 
        mutate(val = val / first(val) * 100) %>%
        mutate(Périmètre.ID = paste(Périmètre.ID,"(base 100)"))
      else . } %>% 
    mutate(lab = ifelse(
      Périmètre == "Groupe" & (Année == first(Année) | Année == last(Année)), 
      hacklabels(val), NA)) %>%
    
        
    ggplot(aes(x=Année,y=val,color=Métrique)) +
    geom_line(aes(group=paste(Périmètre,Périmètre.ID), linetype=Périmètre, alpha=Périmètre), se=FALSE) + 
    geom_point(aes(size=Périmètre)) +
    { if(labels) ggrepel::geom_text_repel(aes(label=seclab), size=4*sizemult, direction="y", color = "grey") } +
    { if(labels) geom_label(aes(label=lab), size=5*sizemult, fontface="bold", direction="y") } +
    facet_wrap(Métrique~.,nrow=facet_nrow, 
               scales=ifelse(norm,"fixed","free_y"), 
               labeller = labeller(Métrique=labellerfun)) +
    xlab("") + #xlab("Année") +
    ylab("") +
    coord_cartesian(clip="off") +
    scale_alpha_manual(values=c(1,0)) +
    scale_size_manual(values=c(1.5,0.5)) +
    scale_linetype_manual(values=c(1,3)) +
    { if (!is.null(colors)) scale_color_manual(values=colors) } +
    #{ if(périm != "Ensemble") scale_x_discrete(breaks = seq(2001,2020,2)) } +
    { if (zeroing) expand_limits(y=c(0)) } +
    #{ if(percentlab & !norm) scale_y_continuous(labels=~scales::percent(.x,accuracy = 1)) } +
    scale_y_continuous(labels=hacklabels) +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) +
    guides(color="none")
}

# plot_all_groupe(1,"DEG",
#                  metriques = c("Qualification.Candidats.MCF","Qualification.Qualifiés.MCF",
#                    "Concours.Candidats.MCF","Concours.Recrutés.MCF"),
#                  labs = c("Candidats qualification","Candidats qualifiés",
#                           "Candidats concours","Candidats recrutés"),
#                  facet_nrow = 2,
#                  norm=TRUE,
#                  colors = séries.MCF.palette)

# metriques <- bind_rows(kpis)
# 
# sous_metriques <- bind_rows(kpis) %>%
#   filter(percentlab) %>%
#   filter(nom %in% c("kpi.MCF.TauxRéussite","kpi.MCF.TauxSélection"))
# 
# 
# 
# 
# plot_all_section("27","ST", 
#                  metriques = sous_metriques$nom,
#                  labs = sous_metriques$lab,
#                  percentlab = TRUE,
#                  facet_nrow = 1,
#                  norm=FALSE)
# 
# plot_all_section("27","ST", 
#                  metriques = sous_metriques$nom,
#                  labs = sous_metriques$lab,
#                  facet_nrow = 1,
#                  norm=TRUE)
# 
# 
# plot_all_section("76","LLASHS", 
#                  metriques = metriques$nom,
#                  egd = TRUE,
#                  labs = metriques$lab,
#                  percentlab = TRUE,
#                  facet_nrow = 1,
#                  norm=FALSE)
# 
# plot_metriques_sections <- function(sectionID, grandedisciplineID, ...) {
#   metriques <- bind_rows(kpis)
# 
#   cowplot::plot_grid(nrow = 2,
#     plot_all_section(sectionID, grandedisciplineID,
#                      metriques = metriques$nom,
#                      labs = metriques$lab,
#                      facet_nrow = 1,
#                      norm=FALSE,
#                      ...) + theme(legend.position = "none"),
#     
#     plot_all_section(sectionID, grandedisciplineID,
#                      metriques = metriques$nom,
#                      egd = TRUE,
#                      labs = metriques$lab,
#                      percentlab = TRUE,
#                      facet_nrow = 1,
#                      norm=TRUE,
#                      ...) + theme(legend.position = "none")
#   )
#   
# }
# 
# plot_metriques_sections("27","ST")

plot_volume_section <- function(sectionID,grandedisciplineID) {
  emploisEC_section(sectionID,grandedisciplineID) %>%
    pivot_longer(
      cols = all_of(c("Concours.Postes.MCF","Concours.Candidats.MCF")),
      names_to = "Métrique",
      values_to = "val"
    ) %>%
    mutate(Périmètre.ID = factor(Périmètre.ID,rev(unique(Périmètre.ID)))) %>%
    # group_by(Année,Métrique) %>%
    # mutate(diffval = val-cumsum(lag(val,default=0))) %>%
    
    ggplot(aes(x=Année,y=val,color=Périmètre.ID,fill=Périmètre.ID,group=Périmètre.ID)) +
    geom_area(alpha = 0.7, size = 1, position = "fill") +
    facet_wrap(.~Métrique) +
    theme_cpesr()
}

#plot_volume_section("61","ST")


plot_volume_discipline <- function(pos="fill") {
  emploisEC %>%
    filter(Périmètre == "Grande discipline") %>%
    pivot_longer(
      cols = all_of(c("Concours.Postes.MCF","Concours.Candidats.MCF")),
      names_to = "Métrique",
      values_to = "val"
    ) %>%
    mutate(Périmètre.ID = fct_rev(as.factor(Périmètre.ID))) %>%
    ggplot(aes(x=Année,y=val,color=Périmètre.ID,fill=Périmètre.ID,group=Périmètre.ID)) +
    geom_area(alpha = 0.7, size = 1, position = pos) +
    facet_wrap(.~Métrique) +
    theme_cpesr()
}

#plot_volume_discipline(pos = "fill")
