library(ggplot2)

data(mtcars)


hp_dataframe <- data.frame(cly = mtcars$cyl, disp = mtcars$disp, hp = mtcars$hp)
mpg_dataframe <- data.frame(cly = mtcars$cyl, disp = mtcars$disp, mpg = mtcars$mpg)


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
