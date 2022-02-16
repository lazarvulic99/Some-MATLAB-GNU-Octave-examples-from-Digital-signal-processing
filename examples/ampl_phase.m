## Copyright (C) 2021 Lenovo
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} ampl_phase (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Lenovo <Lenovo@DESKTOP-47VCI5A>
## Created: 2021-05-25

function [A, P] = ampl_phase (c)
  tstart = tic;
  re = real(c);
  im = imag(c);
  A = sqrt(re^2 + im^2);
  P = atan(im/re);
  tend = toc(tstart);
  disp(['Ukupno vreme izvrsavanja: ' num2str(tend) ' sekundi.']);
endfunction
