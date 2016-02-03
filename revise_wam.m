## Copyright (C) 2015 wang
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
## @deftypefn {Function File} {@var{retval} =} revise_wam (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: wang <wang@wang-VirtualBox>
## Created: 2015-12-08

function new_weighted_adjacency_matrix = revise_wam (weighted_adjacency_matrix)

% Find the indice where their values equal 0.
						 indices = find(weighted_adjacency_matrix == 0);

% Set the 0:s to be infinite large in order to find the minimal value of edges.
% Make sure they are larger than any value of edges.

						 weighted_adjacency_matrix(indices) = inf; 

 

						 new_weighted_adjacency_matrix = weighted_adjacency_matrix;
						 

endfunction
