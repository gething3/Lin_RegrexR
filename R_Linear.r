options(echo=TRUE) 
args <- commandArgs(trailingOnly = TRUE)
print(args)

print("Running linear modelling of data r script")


# # Set notebook variables
if (length(args) < 1){
    print("Missing filename")
    quit(save='yes',status=-1)
    }

filename = args[1]

dataset = read.csv(filename)
dataset

png("r_orig.png")
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'red') +
  ggtitle('y vs x') +
  xlab('x') +
  ylab('y')
dev.off()

library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'red') +
  ggtitle('y vs x') +
  xlab('x') +
  ylab('y')

model = lm(formula = y ~ x,
               data = dataset)

png("r_lm.png")
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'red') +
  geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle('y vs x') +
  xlab('x') +
  ylab('y')
dev.off()

library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'red') +
  geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle('y vs x') +
  xlab('x') +
  ylab('y')

summary(model)


