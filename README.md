# cairo-fortran

This repository contains the libcairo bindings for Fortran from the [gtk-fortran project](https://github.com/vmagnin/gtk-fortran/) available as a separate _fpm_ package.

## Testing cairo-fortran

Each test prints nothing in the terminal but is creating a PNG file. You should therefore obtain three PNG files in the main directory of the project:

```bash
$ fpm test
cairo-auto.f90                         done.
cairo-enums.f90                        done.
cairo-types.f90                        done.
libcairo-fortran.a                     done.
test4.f90                              done.
test1.f90                              done.
test2.f90                              done.
test4                                  done.
test1                                  done.
test2                                  done.
[100%] Project compiled successfully.
$ ls *.png
axis.png  chess.png  F.png
```

### Example test1
![test1](pictures/F.png)
### Example test2
![test2](pictures/axis.png)
### Example test4
![test4](pictures/chess.png)

## fpm
To use cairo-fortran within your own `fpm` project, add the following to your project `fpm.toml` file:

```toml
[dependencies]
cairo-fortran = {git = "https://github.com/vmagnin/cairo-fortran" }
```

## License
GPL-3.0-or-later

## Original project and Authors
* Origin: [gtk-fortran project](https://github.com/vmagnin/gtk-fortran/)
* Authors:
> Vincent MAGNIN, James TAPPIN, Jens HUNGER, Jerry DE LISLE, "gtk-fortran: a GTK+ binding to build Graphical User Interfaces in Fortran", _Journal of Open Source Software,_ 4(34), 1109, 12th January 2019, [https://doi.org/10.21105/joss.01109](https://doi.org/10.21105/joss.01109)

