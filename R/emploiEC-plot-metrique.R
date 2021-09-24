
levels_gdcnu <- c("Ensemble","DEG","LLASHS","Pharma","ST")
palette_gdcnu <- setNames(RColorBrewer::brewer.pal(5, "Set1"), levels_gdcnu)
labeller_100 <- function(x) paste(x, "(base 100)")


plot_metrique <- function(métrique, métriquelab = "Valeur", périm="Ensemble", 
                          norm=FALSE, labels=TRUE, sizemult=1, percentlab=FALSE,
                          facetting=TRUE, maxannée = "2030") {
  
  labellerfun <- ifelse(norm,labeller_100,identity)
  
  emploisEC %>%
    filter(as.character(Année) <= maxannée) %>%
    filter(Périmètre %in% périm) %>%
    mutate(val = !!as.name(métrique)) %>%
    filter(!is.na(val) & val != 0) %>%
    { if(norm) 
      group_by(., Périmètre.ID) %>% 
        mutate(val = val / first(val) * 100)
      else . } %>%
    { if(percentlab & !norm)
      mutate(., lab = scales::percent(val, accuracy=1))
      else if(norm)
        mutate(., lab = format(val, digits=1, decimal.mark=",", big.mark=" " , small.interval=3))
      else
        mutate(., lab = format(val, digits=2, decimal.mark=",", big.mark=" " , small.interval=3)) } %>%
    
    mutate(lab = ifelse(Année == first(Année) |  Année == last(Année), lab, NA)) %>%
    ggplot(aes(x=Année,y=val,color=Périmètre.ID)) +  
    geom_line(aes(group=Périmètre.ID), size=1*sizemult) + geom_point(size=3*sizemult) +
    { if(labels) geom_label(aes(label=lab), size=5*sizemult, fontface="bold", direction="y", show.legend=FALSE) } +
    { if(facetting) facet_wrap(Périmètre.ID~., labeller = labeller(Périmètre.ID=labellerfun)) } +
    xlab("") + #xlab("Année") +
    ylab(métriquelab) +
    coord_cartesian(clip="off") +
    scale_color_manual(values=palette_gdcnu, name="Périmètre") +
    #{ if(périm != "Ensemble") scale_x_discrete(breaks = seq(2001,2020,2)) } +
    { if(!norm) expand_limits(y=c(0)) } +
    #expand_limits(y=c(0)) +
    { if(percentlab & !norm) scale_y_continuous(labels=scales::percent) } +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
}

# plot_metrique("kpi.MCF.TauxTension", percentlab = FALSE, norm = FALSE, sizemult = 1)
# plot_metrique("kpi.MCF.TauxTension", métriquelab = "Tension", périm = "Grande discipline", norm = TRUE, facetting = TRUE)
# 
# plot_metrique("Effectif.EC", métriquelab = "Tension", périm = c("Ensemble","Grande discipline"), norm = FALSE, facetting = FALSE)

