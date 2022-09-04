#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct _matrix
{
	int32_t *mat;
	size_t N;
} * MATRIX;

MATRIX new_mat(size_t n)
{
	MATRIX mat = malloc(sizeof(*mat));
	mat->N = n;
	mat->mat = calloc(n * n, sizeof(*mat->mat));
	return mat;
}

void delete_mat(MATRIX *mat)
{
	free((*mat)->mat);
	free(*mat);
	mat = NULL;
}

int *get_elem(MATRIX *mat, size_t i, size_t j)
{
	return &(*mat)->mat[(*mat)->N * i + j];
}

void get_minor(MATRIX mat, MATRIX *minor, size_t x, size_t y)
{
	if (mat->N <= 1)
	{
		return;
	}

	size_t mi = 0, mj = 0;

	for (size_t i = 0; i < mat->N; ++i)
	{
		if (x == i)
		{
			continue;
		}

		mj = 0;

		for (size_t j = 0; j < mat->N; ++j)
		{
			if (y == j)
			{
				continue;
			}

			*get_elem(minor, mi, mj) = *get_elem(&mat, i, j);

			++mj;
		}

		++mi;
	}
}

void print_mat(MATRIX mat)
{
	for (size_t i = 0; i < mat->N; ++i)
	{
		for (size_t j = 0; j < mat->N; ++j)
		{
			printf("%i\t", *get_elem(&mat, i, j));
		}
		putchar('\n');
	}
}

int64_t get_det(MATRIX mat)
{
	if (mat->N == 1)
	{
		return (int32_t)mat->mat[0];
	}

	MATRIX minor = new_mat(mat->N - 1);
	int64_t det = 0, sign = 1;

	for (size_t i = 0; i < mat->N; ++i)
	{
		get_minor(mat, &minor, 0, i);

		det += sign * (int64_t)*get_elem(&mat, 0, i) * get_det(minor);
		sign *= -1;
	}

	delete_mat(&minor);
	return det;
}

int main()
{
	size_t n = 0;
	// printf("Enter size of Matrix: ");
	scanf("%llu", &n);

	MATRIX mat = new_mat(n);

	for (size_t i = 0; i < n; ++i)
	{
		for (size_t j = 0; j < n; ++j)
		{
			scanf("%i", get_elem(&mat, i, j));
		}
	}

	printf("Matrix is:\n");
	print_mat(mat);

	printf("\nDeterminant is: %lli", get_det(mat));

	// MATRIX minor = get_minor(mat, x, y);
	// printf("Minor(%d , %d) is:\n", x, y);
	// print_mat(minor);
	// delete_mat(&minor);

	delete_mat(&mat);
}
