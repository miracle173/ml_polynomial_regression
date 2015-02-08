## Copyright (C) 2015 Guenter Nowak
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
## @deftypefn {Function File} {@var{retval} =} augmentedCombinations (@var{featureIndices}, @var{featureCombinations})
##
## @seealso{}
## @end deftypefn

## Author: Guenter Nowak <guenter.nowak@gmx.at>
## Created: 2015-02-07

function [indexVector] = augmentedCombinations (featureIndices, featureCombinations)
indexVector=[];

for i=1:length(featureCombinations)
  combinationToCheck=featureCombinations{i};
  for featureIndex=featureIndices
    initialCombination=featureCombinations{featureIndex};
    lastElement=initialCombination(1,end);
    [r,j]=find(combinationToCheck==lastElement);
    firstOccurrence=lookup(initialCombination, lastElement);
    if ((j+length(initialCombination)-firstOccurrence)<=length(combinationToCheck) & (j >=firstOccurrence))
      if all(featureCombinations{i}(1,(j-firstOccurrence+1):(length(initialCombination)+j-firstOccurrence))==initialCombination)
        indexVector=[indexVector i];
        break;
        endif
      endif
  endfor
endfor
endfunction
