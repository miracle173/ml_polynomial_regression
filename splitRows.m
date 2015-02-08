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
## @deftypefn {Function File} {@var{retval} =} splitRows (@var{m}, @var{varargin})
##
## @seealso{}
## @end deftypefn

## Author: Guenter Nowak <guenter.nowak@gmx.at>
## Created: 2015-02-08
## Version 1.0
## Status: working

function [tagVec,tag,pct] = splitRows(m,varargin)

randVec=rand(m,1);
tagVec=zeros(m,1);
tag=0;
p_hi=-1;
pct=0;
for i = 1:length (varargin)
  if p_hi>0
    p_lo=p_hi;
  else 
    p_lo=0;
    endif
  pct+=varargin{i};
  p_hi=pct/100;
  if varargin{i}<=0
    error("percent function argument must be greater 0");
  elseif varargin{i}>=100
    error("percent function argument must be smaller  than 100");
  elseif pct>=100
    error("sum of percent function argument must be smaller  than 100");
    endif
  tagVec+=(++tag)*((p_lo<=randVec) & (randVec<p_hi));
  endfor
p_lo=p_hi;
tagVec+=(++tag)*((p_lo<=randVec));
pct=100-pct;
endfunction
