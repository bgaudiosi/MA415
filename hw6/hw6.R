library(ggmap)
library(tidyverse)

bude <- c(-4.5500, 50.8325)
cricket <- geocode("S W Coast Path, Bude EX23 8HN, UK")
pub <- geocode("Crooklets Inn, Crooklets, Bude EX23 8NF, UK")
summersleaze_beach <- geocode("Summerleaze Cres, Bude EX23 8HN, UK")
crooklets_beach <- geocode("S W Coast Path, Bude EX23 8NE, UK")

##by Yue Wu
##Hotels
fh <- geocode("Falcon Hotel, Bude, UK")
bh <- geocode("The Beach at Bude, Bude, UK")
eh <- geocode("Edgcumbe Hotel, Bude, UK")
sh <- geocode("Sunrise Guest House, Bude, UK")

from <- "S W Coast Path, Bude EX23 8HN, UK"
to <- "Crooklets Inn, Crooklets, Bude EX23 8NF, UK"
route_df <- route(from, to, structure = "route", mode='walking')

map <- get_map(bude, zoom=15)
ggmap(map) +
  geom_point(
    aes(x = lon, y = lat),
    data = cricket, color = "black", size = 2
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = pub, color = "black", size = 2
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = summersleaze_beach, color = "black", size = 2
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = crooklets_beach, color = "black", size = 2
  ) +  
  geom_path(
    aes(x = lon, y = lat), colour = "blue", size = 1,
    data = route_df, lineend = "round"
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Bude Cricket Club"), size =2.5, 
    data = cricket, vjust = -0.5, hjust = 0.5
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Crooklet's Inn"), size =2.5, 
    data = pub, vjust = -0.5, hjust = 0.5
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Summersleaze Beach"), size =2.5, 
    data = summersleaze_beach, vjust = -0.5, hjust = 0.5
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Crooklet's Beach"), size =2.5, 
    data = crooklets_beach, vjust = -0.5, hjust = 0.5
  ) +
  
  #By Yue Wu
  geom_point(
    aes(x = lon, y = lat),
    data = bh, color = "chocolate", size = 2
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = sh, color = "chocolate", size = 2
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = fh, color = "chocolate", size = 2
  ) +  
  geom_text(
    aes(x = lon, y = lat, label = "The Beach At Bude"), size =2, 
    data = bh, vjust = -0.8, hjust = 0.5, color= "burlywood4"
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Sunrise Guest House"), size =2, 
    data = sh, vjust = -0.8, hjust = 0.5, color= "burlywood4"
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Falcon Hotel"), size =2, 
    data = fh, vjust = -0.8, hjust = 0.5, color= "burlywood4"
  )


map2 <- get_map(bude, zoom=15, maptype = "watercolor")
ggmap(map2) +
  geom_point(
    aes(x = lon, y = lat),
    data = cricket, color = "black", size = 2
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = pub, color = "black", size = 2
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = summersleaze_beach, color = "black", size = 2
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = crooklets_beach, color = "black", size = 2
  ) +  
  geom_path(
    aes(x = lon, y = lat), colour = "blue", size = 1,
    data = route_df, lineend = "round"
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Bude Cricket Club"), size =2.5, 
    data = cricket, vjust = -0.5, hjust = 0.5
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Crooklet's Inn"), size =2.5, 
    data = pub, vjust = -0.5, hjust = 0.5
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Summersleaze Beach"), size =2.5, 
    data = summersleaze_beach, vjust = -0.5, hjust = 0.5
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Crooklet's Beach"), size =2.5, 
    data = crooklets_beach, vjust = -0.5, hjust = 0.5
  ) +

#By Yue Wu
geom_point(
  aes(x = lon, y = lat),
  data = bh, color = "chocolate", size = 2
) +
  geom_point(
    aes(x = lon, y = lat),
    data = sh, color = "chocolate", size = 2
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = fh, color = "chocolate", size = 2
  ) +  
  geom_text(
    aes(x = lon, y = lat, label = "The Beach At Bude"), size =2, 
    data = bh, vjust = -0.8, hjust = 0.5, color= "burlywood4"
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Sunrise Guest House"), size =2, 
    data = sh, vjust = -0.8, hjust = 0.5, color= "burlywood4"
  ) +
  geom_text(
    aes(x = lon, y = lat, label = "Falcon Hotel"), size =2, 
    data = fh, vjust = -0.8, hjust = 0.5, color= "burlywood4"
  )

