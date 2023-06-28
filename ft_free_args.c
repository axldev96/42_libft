/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_free_args.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: acaceres <acaceres@student.42madrid.com>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/28 22:00:16 by acaceres          #+#    #+#             */
/*   Updated: 2023/06/28 22:04:06 by acaceres         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdarg.h>

void	ft_free_args(int argc, ...)
{
	va_list	args;
	size_t	i;

	i = 0;
	va_start(args, argc);
	while (i < argc)
	{
		free(va_arg(args, void *));
		i++;
	}
	va_end(args);
}
