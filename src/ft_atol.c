/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atol.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gabriel <gabriel@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/10 00:23:16 by greus-ro          #+#    #+#             */
/*   Updated: 2024/07/01 22:52:46 by gabriel          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_is_removable_char(char c)
{
	if (c == ' ' || c == '\t' || c == '\n' || c == '\v' || c == '\r'
		|| c == '\f')
		return (1);
	return (0);
}

static int	ft_check_sign(char **nbr)
{
	int	sign;

	if (ft_isdigit(**nbr) == 1)
		return (1);
	sign = 0;
	while (**nbr != '\0' && (**nbr == '-' || **nbr == '+'))
	{
		if (sign != 0)
			return (0);
		if (**nbr == '-')
			sign = -1;
		else
			sign = 1;
		(*nbr)++;
	}
	return (sign);
}

long	ft_atol(const char *nbr)
{
	long	total;
	int		sign;
	char	*number;

	number = (char *)nbr;
	while (*number != '\0' && ft_is_removable_char(*number) == 1)
		number++;
	sign = ft_check_sign(&number);
	if (sign == 0)
		return (0);
	total = 0;
	while (*number != '\0')
	{
		if (ft_isdigit(*number) == 1)
			total = total * 10 + (*number - '0');
		else
			return (total * sign);
		number++;
	}
	return (total * sign);
}
