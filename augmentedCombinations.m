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
## @deftypefn {Function File} {@var{retval} =} augmentedCombinations (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Guenter Nowak <guenter.nowak@gmx.at>
## Created: 2015-02-07

function [indexVector] = augmentedCombinations (featureIndex, featureCombinations)
initialCombination=featureCombinations{featureIndex};
indexVector=[featureIndex];
initialCombinationLength=length(initialCombination);
lastElement=initialCombination(1,end);
firstOccurrence=lookup(initialCombination, lastElement);
tailLength=initialCombinationLength-firstOccurrence;

for i=(featureIndex+1):length(featureCombinations)
  v=featureCombinations{i};
  [r,j]=find(v==lastElement);
  if ((j+initialCombinationLength-firstOccurrence)<=length(v) & (j >=firstOccurrence))
    %disp(v); 2 3 3, fO=2  j=2 iC=2
    %keyboard()
    if all(featureCombinations{i}(1,(j-firstOccurrence+1):(initialCombinationLength+j-firstOccurrence))==initialCombination)
      indexVector=[indexVector i];
      endif
    endif
  endfor
endfunction
