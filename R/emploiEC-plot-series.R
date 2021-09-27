
labeller_100 <- function(x)  paste(x, "(base 100)")

plot_series <- function(métriques, métriqueslab, périm=NULL, périmid=NULL, norm=FALSE, labels=TRUE, sizemult=1,
                        colors=séries.MCF.palette, normbreaks=seq(50,150,25), maxannée = "2030") {
  
  labellerfun <- ifelse(norm,labeller_100,identity)
  
  emploisEC %>%
    filter(as.character(Année) <= maxannée) %>%
    { if(!is.null(périm)) filter(.,Périmètre == périm) else . } %>%
    { if(!is.null(périmid)) filter(.,Périmètre.ID == périmid) else . } %>%
    select("Année","Périmètre.ID",all_of(métriques))%>%
    pivot_longer(-c(Année,Périmètre.ID), names_to = "Série", values_to = "Nombre") %>%
    mutate(Série = factor(Série, levels=métriques, labels=métriqueslab)) %>%
    { if(norm) 
      group_by(., Périmètre.ID,Série) %>% 
        mutate(Nombre = Nombre / first(Nombre) * 100)
      else .  } %>% 
    { if(norm)
        mutate(., lab = format(Nombre, digits=1, decimal.mark=",", big.mark=" " , small.interval=3))
      else
        mutate(., lab = format(Nombre, digits=2, decimal.mark=",", big.mark=" " , small.interval=3)) } %>%
    mutate(lab = ifelse(Année == first(Année) |  Année == last(Année), lab, NA)) %>%
    
    ggplot(aes(x=Année,y=Nombre,color=Série)) +
    #geom_smooth(aes(group=Série), se=FALSE) +
    geom_line(aes(group=Série), size=1*sizemult) + 
    geom_point(size=3*sizemult) +
    { if(labels) geom_label(aes(label=lab), size=5*sizemult, fontface="bold", direction="y", show.legend=FALSE) } +
    coord_cartesian(clip="off") +
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
