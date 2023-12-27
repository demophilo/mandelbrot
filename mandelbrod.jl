using Images

function mandelbrot_subset(xmin, xmax, ymin, ymax, width, height, max_iter)
    img = zeros(RGB, height, width)

    if abs(ymin) > abs(ymax)
        ymax = 0.0
    else
        ymin = 0.0
    end

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

    if abs(ymin) > abs(ymax)
        img = vcat(reverse(img, dims=1), img)
    else
        img = vcat(img, reverse(img, dims=1))
    end
    
    return img
end

width = 9600
height = 9600
max_iterations = 1000000
x_mitte = 0.0
y_mitte = 0.0
zoom = 0.5
xmin = x_mitte - 1 / zoom
xmax =  x_mitte + 1 / zoom
ymin = y_mitte - height / zoom / width
ymax = y_mitte + height / zoom  / width



subset_image = mandelbrot_subset(xmin, xmax, ymin, ymax, width, height, max_iterations)

# Speichern des Teilbereichs der Mandelbrot-Menge als Bild
save("mandelbrot_subset.png", subset_image)
