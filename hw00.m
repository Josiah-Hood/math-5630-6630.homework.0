% Author: Your Name / your_email
% Date: 2024-09-01
% Assignment Name: hw00

% The following class defines 3 functions for each problem respectively.
% Please follow the instruction inside each function. 

% Author: Josiah / josiahhood03@auburn.edu
% Date: 2024-09-05
% Assignment Name: hw00

classdef hw00
    methods (Static)

        function a_m = p1(m)
            % Computes the m-th term of the sequence where:
            % a_0 = 0, a_1 = 1, a_2 = 1, and a_n = a_{n-1} + a_{n-2} + a_{n-3} for n >= 3.
            % :param m: Non-negative integer
            % :return: The value at the specified index in the sequence

            if m < 0
                error('m must be a non-negative integer.');
            end

            % Define base cases
            if m == 0
                a_m = 0;
                return;
            elseif m == 1 || m == 2
                a_m = 1;
                return;
            end

            % Initialize the sequence
            a_0 = 0;
            a_1 = 1;
            a_2 = 1;

            % Compute sequence up to m
            for n = 3:m
                a_m = a_0 + a_1 + a_2;
                a_0 = a_1;
                a_1 = a_2;
                a_2 = a_m;
            end
        end

        function det_A = p2(A)
            % Computes the determinant of a square matrix using Laplace expansion.
            % :param A: A square matrix
            % :return: Determinant of the matrix

            if size(A, 1) ~= size(A, 2)
                error('A must be a square matrix.');
            end

            n = size(A, 1);
            if n == 1
                det_A = A(1,1);
            elseif n == 2
                det_A = A(1,1) * A(2,2) - A(1,2) * A(2,1);
            else
                det_A = 0;
                for i = 1:n
                    % Calculate the minor matrix by removing the first row and the i-th column
                    minor = A(2:end, [1:i-1, i+1:end]);
                    % Add or subtract the determinant of the minor matrix times the cofactor
                    det_A = det_A + ((-1)^(1 + i)) * A(1,i) * hw00.p2(minor);
                end
            end
        end

        function p3()
            % Simulates a delay of approximately one second.
            % :return: None

            % Measure time and create a delay loop
            tic;
            while toc < 1
                % Busy wait loop for roughly one second
            end
            fprintf('Approximately one second has passed.\n');
        end
    end
end

% Chat Gpt was used to help write code 
