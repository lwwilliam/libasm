#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>

int ft_strlen(char * str);
char *ft_strcpy(char *dst, char *src);
int ft_strcmp(char *s1, char *s2);
ssize_t ft_write(int fd, char* str, size_t count);
ssize_t ft_read(int fd, char* str, size_t count);
char *ft_strdup(const char *s);



int main()
{
    printf ("----------ft_strlen----------\n");
    char *str = "1234567890";
    int l = strlen(str);
    printf("strlen: %d\n", l);
    int len = ft_strlen(str);
    printf("ft_strlen: %d   ", len);

    printf ("\n\n----------ft_strcpy----------\n");
    char buffer[100];
    char *dst = buffer;
    char *src = "test";
    char *ret = strcpy(dst, src);
    printf("strcpy: >%s< >%s< >%s<\n", ret, dst, src);
    printf("strcpy: %p %p %p %p\n", &ret, &dst, &src, &buffer);
    printf("strcpy: %p\n\n", strcpy(dst, src));

    char ft_buffer[100];
    char *ft_dst = ft_buffer;
    char *ft_src = "test";
    char *ft_ret = ft_strcpy(ft_dst, ft_src);
    printf("ft_strcpy: >%s< >%s< >%s<\n", ft_ret, ft_dst, ft_src);
    printf("ft_strcpy: %p %p %p %p\n", &ft_ret, &ft_dst, &ft_src, &ft_buffer);
    printf("ft_strcpy: %p\n", ft_strcpy(ft_dst, ft_src));

    printf ("\n\n----------ft_strcmp----------\n");
    char *s1 = "abc";
    char *s2 = "123";
    char *s3 = "acb";
    char *s4 = "abc";
    printf("strcmp: %d %d %d %d\n", strcmp(s1, s2), strcmp(s2,s3), strcmp(s1,s3), strcmp(s1, s4));
    printf("ft_strcmp: %d %d %d %d\n", ft_strcmp(s1, s2), ft_strcmp(s2,s3), ft_strcmp(s1,s3), ft_strcmp(s1, s4));

    printf ("\n\n----------ft_write----------\n");
    char *w_str = "testing";
    int w_len = strlen(w_str);
    write(1, "write: ", 8);
    printf(" (%ld)\n", write(1, w_str, w_len));
    ft_write(1, "write: ", 8);
    printf(" (%ld)\n", ft_write(1, w_str, w_len));

    int fd = open("write.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    int w_fd = open("ft_write.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    char *w_writeStr = "writing to file\n";
    int w_writeLen = strlen(w_writeStr);
    write(fd, w_writeStr, w_writeLen);
    ft_write(w_fd, w_writeStr , w_writeLen);
    close(fd);
    close(w_fd);

    printf ("\n\n----------ft_read----------\n");
    int r_fd = open("write.txt", O_RDONLY);
    int r_writeFd = open("ft_write.txt", O_RDONLY);

    char r_buffer[100];
    int r_len = read(r_fd, r_buffer, 100);
    write(1, "read: ", 6);
    write(1, r_buffer, r_len);
    printf("(%d)\n", r_len);

    char r_writeBuffer[100];
    int r_writeLen = ft_read(r_writeFd, r_writeBuffer, 100);
    write(1, "ft_read: ", 9);
    write(1, r_writeBuffer, r_writeLen);
    printf("(%d)\n", r_writeLen);

    close(r_fd);
    close(r_writeFd);
}