library(tidyverse)
library(ggalluvial)
library(gganimate)
library(gifski)
library(ggcpesrthemes)

# Qualification.Qualifié.Recruté
# Qualification.Qualifié.Recruté
# Qualification.NonQualifié
# DéjàQualifié.DéjàQualifié



plot_flux_col <- function(périm=NULL, périmid=NULL, année=NA, sizemult=1, facetting = TRUE) {
  
  if(is.na(année)) {
    df <- emploisEC %>% filter(Source != "Galaxie")
    année <- max(as.character(df$Année))
  }
  
  emploisEC %>%
    { if(!is.null(périm)) filter(.,Périmètre == périm) else . } %>%
    { if(!is.null(périmid)) filter(.,Périmètre.ID == périmid) else . } %>%
    { if(!is.null(année)) filter(.,Année == année) else . } %>%

    pivot_longer(
      cols = all_of(séries.MCF),
      names_to = "Métrique",
      values_to = "Nombre"
      ) %>%
    mutate(Métrique = factor(Métrique, levels=séries.MCF,labels=séries.MCF.lab)) %>%
    mutate(lab = as.character(Nombre)) -> df

    ggplot(df, aes(x=Métrique,y=Nombre,fill=Métrique)) +
    geom_col(color = "black") +
    geom_text(aes(label=lab), size=6*sizemult, vjust=-0.2) +
    expand_limits(y=max(df$Nombre)*1.05) +
    coord_cartesian(clip = 'off') +
    { if (facetting) if (is.null(année)) facet_wrap(Périmètre.ID ~ Année) else facet_wrap(Périmètre.ID~.) } +
    scale_x_discrete(labels = ~ str_replace(.x," ","\n")) +
    scale_fill_manual(values=séries.MCF.palette, guide = "none") +
    xlab("") + ylab("")
}

# plot_flux_col(périm="Ensemble")
# plot_flux_col(périm="Grande discipline", sizemult = 0.5)

# 
# a <- plot_flux_col(périm="Ensemble", année=NULL) +
#   transition_states(Année, wrap = FALSE) +
#   ggtitle("Entrée dans la carrière d'enseignant-chercheur", subtitle = "Année : {closest_state}")
# 
# animate(a, height = 450, width = 800, fps = 30, duration = 10,
#         end_pause = 60, res = 100, renderer = gifski_renderer())
# anim_save("recrutement.gif")



palette_alluvial <- c("red2","#33A02C","#1F78B4","#B2DF8A","#33A02C")
names(palette_alluvial) <- c("Echec","Réussite","Qualifiés","Candidats","Recrutés")

plot_flux_alluvial <- function(périm=NULL, périmid=NULL, année=NA, sizemult = 1, facetting = TRUE) {
  
  if(is.na(année)) {
    df <- emploisEC %>% filter(Source != "Galaxie")
    année <- max(as.character(df$Année))
  }
  
  emploisEC %>%
    { if(!is.null(périm)) filter(.,Périmètre == périm) else . } %>%
    { if(!is.null(périmid)) filter(.,Périmètre.ID == périmid) else . } %>%
    { if(!is.null(année)) filter(.,Année == année) else . } %>%
    group_by(Année,Périmètre.ID) %>%
    
    transmute(
      Année,
      Périmètre.ID,
      
      Réussite.Qualification.Qualifiés = Qualification.Qualifiés.MCF,
      Echec.Qualification.Echec = Qualification.Candidats.MCF - Qualification.Qualifiés.MCF,
      
      Réussite.Concours.Candidats = Concours.Candidats.MCF,
      Echec.Concours.Echec = Echec.Qualification.Echec,
      
      Réussite.Recrutement.Recrutés = Concours.Recrutés.MCF,
      Echec.Recrutement.Echec = Echec.Qualification.Echec + Concours.Candidats.MCF - Concours.Recrutés.MCF,
      
    ) %>%
    
    pivot_longer(
      cols = -c(Année,Périmètre.ID),
      names_to = c("ID","Phase","Pop"),
      names_sep = "\\.",
      values_to = "Nombre"
    ) %>%
    mutate(
      Phase = factor(Phase,levels=c("Qualification","Concours","Recrutement")),
      Pop = factor(Pop,levels=c("Echec","Réussite","Qualifiés","Candidats","Recrutés")),
      ID = factor(ID,levels=c("Echec","Réussite","Qualifiés","Candidats","Recrutés"))
    ) %>%
    
    ggplot(aes(x=Phase,y=Nombre,stratum=Pop,alluvium=ID)) +
    { if (facetting) if (is.null(année)) facet_wrap(Périmètre.ID ~ Année) else facet_wrap(Périmètre.ID~.) } +
    geom_stratum(aes(fill=Pop)) +
    geom_flow(aes(fill=ID)) +
    scale_fill_manual(values=palette_alluvial,name="") +
    ylab("")
}


# plot_flux_alluvial(périm="Ensemble", facetting = FALSE)
# plot_flux_alluvial(périm="Grande discipline",année=2019) 
# plot_flux_alluvial(périm="Grande discipline", périmid="ST",année=NULL) 



 
plot_flux_lignes <- function(périm=NULL, périmid=NULL, année=NULL, norm = FALSE, sizemult=1) {
  
  df <- emploisEC %>%
    mutate(Année = as.character(Année)) %>%
    filter(Source == "CNU") %>%
    { if(!is.null(périm)) filter(.,Périmètre == périm) else . } %>%
    { if(!is.null(périmid)) filter(.,Périmètre.ID == périmid) else . } %>%
    { if(!is.null(année)) filter(.,Année == année) else . } 
  dfl <- length(unique(df$Année))
  
  df %>%  
    pivot_longer(
      cols = all_of(séries.MCF),
      names_to = "Métrique",
      values_to = "Nombre"
    ) %>%
    mutate(Métrique = factor(Métrique, levels=séries.MCF,labels=séries.MCF.lab)) %>%
    mutate(lab = as.character(Nombre)) %>% 
    arrange(Année) %>%
    { if(norm) 
      group_by(., Périmètre.ID, Métrique) %>% 
        mutate(Nombre = Nombre / first(Nombre) * 100) %>%
        mutate(Périmètre.ID = paste(Périmètre.ID,"(base 100)"))
      else . } %>% 
    
    ggplot(aes(x=Métrique,y=Nombre,color=Année)) +
    geom_line(aes(group=Année)) +
    geom_point() +
    facet_wrap(.~Périmètre.ID) +
    expand_limits(y=0) +
    scale_x_discrete(labels=~str_replace(.x," ","\n")) +
    { if(norm) scale_y_continuous(breaks=seq(0,120,20)) } + 
    scale_color_manual(values=colorRampPalette(rev(RColorBrewer::brewer.pal(11,"RdBu")))(dfl)) +
    xlab("") + ylab("") +
    theme(legend.position = "right") 
}

# plot_flux_lignes(périm="Grande discipline", périmid="ST", norm=TRUE)








