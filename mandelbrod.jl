using Images

function mandelbrot_subset(xmin, xmax, ymin, ymax, width, height, max_iter)
    img = zeros(RGB, height, width)
    for (i, y) in enumerate(range(ymin, ymax, length=height))
        for (j, x) in enumerate(range(xmin, xmax, length=width))
            c = x + y * im
            z = 0
            iter = 0
            while abs(z) < 2 && iter < max_iter
                z = z^2 + c
                iter += 1
            end
            # Setze Farben basierend auf der Iteration
            img[i, j] = RGB(iter % 10 / 10, iter % 20 / 20, iter % 30 / 30)
        end
    end
    return img
end

# Bereich für den Teilbereich der Mandelbrot-Menge
x_mitte = 0.0
y_mitte = 0.0
zoom = 0.5
xmin = x_mitte - 1 / zoom
xmax =  x_mitte + 1 / zoom
ymin = y_mitte - 1 / zoom
ymax = y_mitte + 1 / zoom 

width = 3200
height = width  # Bildgröße
max_iterations = 360  # Maximale Anzahl an Iterationen

subset_image = mandelbrot_subset(xmin, xmax, ymin, ymax, width, height, max_iterations)

# Speichern des Teilbereichs der Mandelbrot-Menge als Bild
save("mandelbrot_subset.png", subset_image)
