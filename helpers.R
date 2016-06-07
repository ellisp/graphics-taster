.mod_transform <- function(y, lambda){
    if(lambda != 0){
        yt <- sign(y) * (((abs(y) + 1) ^ lambda - 1) / lambda)
    } else {
        yt = sign(y) * (log(abs(y) + 1))
    }
    return(yt)
}


.mod_inverse <- function(yt, lambda){
    if(lambda != 0){
        y <- ((abs(yt) * lambda + 1)  ^ (1 / lambda) - 1) * sign(yt)
    } else {
        y <- (exp(abs(yt)) - 1) * sign(yt)
        
    }
    return(y)
}

prettify <- function(breaks){
    # round numbers, more aggressively the larger they are
    digits <- -floor(log10(abs(breaks))) + 1
    digits[breaks == 0] <- 0
    return(round(breaks, digits = digits))
}

mod_breaks <- function(lambda, n = 8, prettify = TRUE){
    function(x){
        breaks <- .mod_transform(x, lambda) %>%
            pretty(n = n) %>%
            .mod_inverse(lambda)
        if(prettify){
            breaks <- prettify(breaks)
        }
        return(breaks)
    }
}

modulus_trans <- function(lambda){
    trans_new("modulus",
              transform = function(y){
                  if(lambda != 0){
                      yt <- sign(y) * (((abs(y) + 1) ^ lambda - 1) / lambda)
                  } else {
                      yt = sign(y) * (log(abs(y) + 1))
                  }
                  return(yt)
              },
              inverse = function(yt){
                  if(lambda != 0){
                      y <- ((abs(yt) * lambda + 1)  ^ (1 / lambda) - 1) * sign(yt)
                  } else {
                      y <- (exp(abs(yt)) - 1) * sign(yt)
                      
                  }
                  return(y)
              }
    )
}