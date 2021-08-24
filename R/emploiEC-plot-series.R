
labeller_100 <- function(x)  paste(x, "(base 100)")

plot_series <- function(métriques, métriqueslab, périm=NULL, périmid=NULL, norm=FALSE, 
                        colors=séries.MCF.palette, normbreaks=seq(50,150,25)) {
  
  labellerfun <- ifelse(norm,labeller_100,identity)
  
  emploisEC %>%
    { if(!is.null(périm)) filter(.,Périmètre == périm) else . } %>%
    { if(!is.null(périmid)) filter(.,Périmètre.ID == périmid) else . } %>%
    select("Année","Périmètre.ID",all_of(métriques))%>%
    pivot_longer(-c(Année,Périmètre.ID), names_to = "Série", values_to = "Nombre") %>%
    na_if(0) %>%
    mutate(Série = factor(Série, levels=métriques, labels=métriqueslab)) %>%
    { if(norm) 
      group_by(., Périmètre.ID,Série) %>% 
        mutate(Nombre = Nombre / first(Nombre) * 100)
      else .  } %>% 
    
    ggplot(aes(x=Année,y=Nombre,color=Série)) +
    #geom_smooth(aes(group=Série), se=FALSE) +
    geom_line(aes(group=Série)) + 
    geom_point() +
    xlab("") + ylab("") + #xlab("Année") +
    facet_wrap(Périmètre.ID~., labeller = labeller(Périmètre.ID=labellerfun)) +
    scale_color_manual(values=colors) +
    { if(norm) scale_y_continuous(breaks = normbreaks) } +
    #{ if(périm != "Ensemble") scale_x_discrete(breaks = seq(2001,2020,2)) } +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
}

#plot_series(levels_context, labs_context, périm="Grande discipline",norm=TRUE, colors=palette_context) + theme_cpesr()


# plot_series(séries.MCF,séries.MCF.lab, périm="Grande discipline",norm=TRUE)
# 
# plot_series(séries.MCF,séries.MCF.lab, périm="Section",périmid="1",norm=FALSE)
