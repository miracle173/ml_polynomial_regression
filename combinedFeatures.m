## Copyright (C) 2015 gunowak
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} combinedFeatures (@var{featureCount}, @var{maxPower})
##
## @seealso{}
## @end deftypefn

## Author: Guenter Nowak <guenter.nowak@gmx.at>
## Created: 2015-02-06

function [columnPower] = combinedFeatures (featureCount, maxPower)
  t=0;
  columnPower={};
  P=[];
  %initialize
  hiProd=0;
  loCol=1;
  for i=1:featureCount
    columnPower{++t}=[i];
    endfor
  hiCol=t;
  
  for p=2:maxPower
    loProd=hiProd+1;
    hiProd=t;
    for i=loCol:hiCol
      for j=loProd:hiProd
        if i >= columnPower{j}(1,end)
          columnPower{++t}=[columnPower{j},i];
          endif
        endfor
      endfor
    endfor
endfunction
