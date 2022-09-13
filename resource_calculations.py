import numpy as np

# for the 96^3 DOF TGV
poly_degree = 5
number_of_elements_per_direction = 16
DOFs_per_dim = number_of_elements_per_direction*(poly_degree+1)
dim = 3

DOFs_total = 1.0
for d in range(0,dim):
    DOFs_total *= DOFs_per_dim

# Narval parameters
# Ref: https://docs.computecanada.ca/wiki/Advanced_MPI_scheduling
mem_per_node = 249.0 # GiB
tasks_per_node = 64.0
mem_per_task = 3.9 

# Resources used before:
number_of_nodes = 8
total_memory = number_of_nodes*mem_per_node