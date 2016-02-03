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
## @deftypefn {Function File} {@var{retval} =} shortestpath (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: wang <wang@wang-VirtualBox>
## Created: 2015-12-27

function [distance, path] = shortestpath(wam, start, target)

% Get the total number of nodes in  the matrix.
n = getNodes(wam);

% Check if user input right parameters corresponding to n x n weighted adjacency matrix.
if((start<0||start>n)||(target<0||target>n))
  disp("Nodes number: start or target point is wrong!");
else
	
% Check the special case that the start point is the same as target point.
if(start == target)
    disp("The shortest path: "); 
    path = [start, target];
    disp(path);
    disp("The distance: 0");
else

% Set all the 0:s in the matrix to be infinite for calculations sake.  
revised_wam = revise_wam(wam);


% Set of the checked nodes, initialization "unchecked"/0:s/false
checked(1:n) = 0;
% Set of distances, init infinite.
dist(1:n) = inf;
% Previous nodes, init 0:s
prev_node(1:n) = 0;
% Init the distance of start-to-start point as 0
dist(start) = 0; 
% Init the output distance as infinite.
distance = inf;

% Find relation to every other nodes except the startpoint so that n-1 loops is enough.
  for i = 1:(n - 1),
   
   % Find the index of the unchecked nodes(flag == 0 in the checked vector)
   % Toggle: Unchecked nodes is marked as 1, checked_nodes as 0.
   index = (checked == 0);

   % Build a temprary vector,init infinite.
   tmp_vector(1:n) = inf;
   % Add the value under the index in dist to temprary vector
   tmp_vector(index) = dist(index);

  
   % Find out the minimal value & location/column_number/node in the tmp_vector
   [value, u] = min(tmp_vector);
   % Mark the node as "checked"/1/true.
   checked(u) = 1;

% Find the unchecked node(u):s distance to all nodes and compare
   for v = 1:n,

             % Find the shortest path values and compare, do dijkstra algorithm.
	     % If distance via u -> v is shorter than that of [start_point -> v], readjust the distance value
	     if(dist(v) > revised_wam(u,v) + dist(u)),
	       dist(v) =  revised_wam(u,v) + dist(u);
             % Save the checked node in the parent vector
             prev_node(v) = u;
             end;
   end;
end;

% Find the shortest path nodes in start-to-target order.
if prev_node(target) != 0, 
    path = target; 
    distance = dist(target);
    while target != start, 
       
        % Traverse the selected nodes
        mid_node = prev_node(target);

        % Place the select path nodes from target_point to start_point, right to left.
        path =[mid_node path]; 
        target = mid_node;
        end;
end;

% Display the path and total distance.
disp("The shortest path: ");
disp(path);
disp("The distance: ");

% End the if-else sats.
end;  
end;

endfunction
