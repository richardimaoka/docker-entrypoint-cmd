FROM ubuntu:16.04

## 1. CMD only
#
# 1.1 `docker run {image_name} "extra_arg"` will cause an exception as there is no command named "extra_arg"
CMD ["echo"] 
#
# 1.2 Same thing as 1.1. Arguments passed from `docker run` will cause an error.
# CMD ["echo", "Hi there"] 
#
# 1.3  `docker run --entrypoint echo {image_name}` will display:
#  > 
# i.e. diplay an empty string. So CMD is ignored, and not used as the default argment for the overridden --entrypoint
# CMD ["ps"] 
#
# 1.4  `docker run --entrypoint echo {image_name} "extra_arg"` will display:
#  > extra_arg
# i.e. same as 1.3. CMD is ignored, and not used as the default argment for the overridden --entrypoint
# CMD ["ps"] 

## 2. ENTRYPOINT only
#
# 2.1 `docker run {image_name} "extra_arg"` will add "extra_arg" as an argument
# So it displays:
#  >Hi there!! extra_arg
#ENTRYPOINT ["echo", "Hi there!!"]

## 3. ENTRYPOINT and CMD
#
# 3.1 `docker run {image_name}` displays:
#  >Hi there!! Yo!
# CMD ["Yo!"]
# ENTRYPOINT ["echo", "Hi there!!"]
#
# 3.2 `docker run {image_name} "extra_arg"` will replace the arguments in CMD with "extra_arg"
# So it displays:
#  >Hi there!! extra_arg
#CMD ["Yo!"]
#ENTRYPOINT ["echo", "Hi there!!"]
