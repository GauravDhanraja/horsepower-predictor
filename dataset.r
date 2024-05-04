library(ggplot2)

data(mtcars)

disp = mtcars$disp
cly = mtcars$cyl
hp = mtcars$hp

mtdata = data.frame(cly, disp, hp)

write.csv(mtdata, "mtdata.csv", row.names = FALSE)

combined_dataframe <- data.frame(cly = mtcars$cyl, disp = mtcars$disp, hp = mtcars$hp, mpg = mtcars$mpg)

hp_dataframe <- subset(combined_dataframe, select = c(cly, disp, hp))
mpg_dataframe <- subset(combined_dataframe, select = c(cly, disp, mpg))

color_scheme <- c(low = "blue", high = "red")

hp_map <- ggplot(hp_dataframe, aes(x = disp, y = cly, fill = hp)) +
            geom_tile() +
            labs(x = "Engine Displacement", y = "Number of Cylinders", fill = "Horsepower") +
            ggtitle("Heatmap of Horsepower Distribution by Engine Displacement and Number of Cylinders") +
            scale_fill_continuous(name = "Horsepower", low = "blue", high = "red")

mpg_map <- ggplot(mpg_dataframe, aes(x = disp, y = cly, fill = mpg)) +
            geom_tile() +
            labs(x = "Engine Displacement", y = "Number of Cylinders", fill = "MPG") +
            ggtitle("Heatmap of MPG Distribution by Engine Displacement and Number of Cylinders") +
            scale_fill_continuous(name = "MPG", low = "blue", high = "red")

ggsave("./plots/hp_heatmap.png", hp_map, width = 8, height = 5, units = "in", dpi = 500)
ggsave("./plots/mpg_heatmap.png", mpg_map, width = 8, height = 5, units = "in", dpi = 500)