# cairo-fortran

This repository contains the libcairo bindings for Fortran from the [gtk-fortran project](https://github.com/vmagnin/gtk-fortran/) available as a separate _fpm_ package.

## Original project and Authors
Origin: [gtk-fortran project](https://github.com/vmagnin/gtk-fortran/)
Authors:
> Vincent MAGNIN, James TAPPIN, Jens HUNGER, Jerry DE LISLE, "gtk-fortran: a GTK+ binding to build Graphical User Interfaces in Fortran", _Journal of Open Source Software,_ 4(34), 1109, 12th January 2019, [https://doi.org/10.21105/joss.01109](https://doi.org/10.21105/joss.01109)

## License
GPLv3

## fpm
To use cairo-fortran within your `fpm` project, add the following to your project `fpm.toml` file:

```toml
[dependencies]
cairo = {git = "https://github.com/brocolis/cairo-fortran" }
```

### Example test1
![test1](F.png)
