module Mandelbrot



using Images

function mandelbrot_subset(xmin, xmax, ymin, ymax, width, height, max_iter)
    img = zeros(RGB, height, width)


    for (i, y) in enumerate(range(ymin, ymax, length=height))
        for (j, x) in enumerate(range(xmin, xmax, length=width))
            c = x + y * im
            z = 0
            iter = 0
            if (x^2 + y^2 - (1/4)^2)^2 >= ((x-1/4)^2 + y^2)/4 && 16 * (x+1)^2 + 16 * y^2 >= 1
                while abs(z) < 2 && iter < max_iter
                    z = z^2 + c
                    iter += 1
                end
                
            else
                iter = 0
            end

            if iter == max_iter
                iter = 0
            end
            # Setze Farben basierend auf der Iteration
            img[i, j] = RGB(iter % 10 / 10, iter % 20 / 20, iter % 30 / 30)
        end
    end



    return img
end

width = 20000
height = 20000
max_iterations = 2000000
x_mitte = 0.250200002343
y_mitte = 0.0000049998
zoom =10000000000
xmin = x_mitte - 1 / zoom
xmax =  x_mitte + 1 / zoom
ymin = y_mitte - height / zoom / width
ymax = y_mitte + height / zoom  / width



subset_image = mandelbrot_subset(xmin, xmax, ymin, ymax, width, height, max_iterations)


save("mandelbrot_6.png", subset_image)


end # module Mandelbrot
