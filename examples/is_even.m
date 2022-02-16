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
## @deftypefn {} {@var{retval} =} is_even (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Lenovo <Lenovo@DESKTOP-47VCI5A>
## Created: 2021-05-23

function isEven = is_even (N1, N2)
  isEven = 1 - mod(N1:N2, 2);
  %isEven = zeros(1, N2-N1+1);
  n = N1;
  k = 1;
  while n<=N2
    %isEven(k) = 1 - mod(n, 2);
    switch isEven(k)
      case 0
        disp(['Broj ' num2str(n) ' je neparan.']);
      otherwise
        disp(['Broj ' num2str(n) ' je paran.']);
    endswitch
    n = n + 1;
    k = k + 1;
  endwhile
endfunction
