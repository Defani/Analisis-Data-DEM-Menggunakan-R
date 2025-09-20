# Instal dan muat paket 'terra'
install.packages("terra")
library(terra)

# Muat data DEM Anda
# Ganti "your path/DEM.tif" dengan path file DEM Anda yang sebenarnya
dem <- rast("your path/DEM.tif")

# Hitung slope (kemiringan) dan aspect (arah lereng)
slope <- terrain(dem, v = "slope", unit = "degrees")
aspect <- terrain(dem, v = "aspect", unit = "degrees")

# Buat hillshade (efek bayangan)
hill <- shade(slope, aspect, angle = 45, direction = 315)

# Atur tata letak plot untuk menampilkan tiga peta dalam satu baris
par(mfrow = c(1, 3), mar = c(4, 4, 4, 6))

# Plot peta slope
plot(slope, col = terrain.colors(100),
     main = "Slope Kecamatan Rancah",
     plg = list(title = "Derajat"))
grid(col = "gray50", lty = 1, lwd = 0.4)

# Plot peta topografi (DEM)
plot(dem, col = rev(topo.colors(100)),
     main = "Topografi Kecamatan Rancah",
     plg = list(title = "MDPL"))
grid(col = "gray50", lty = 1, lwd = 0.4)

# Plot peta hillshade
plot(hill, col = gray.colors(100, start = 0, end = 1),
     main = "Hillshade Kecamatan Rancah")
grid(col = "gray50", lty = 1, lwd = 0.4)