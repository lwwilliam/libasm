#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

extern int errno;

int _ft_strlen(char * str);
char *_ft_strcpy(char *dst, char *src);
int _ft_strcmp(char *s1, char *s2);
ssize_t _ft_write(int fd, char* str, size_t count);
ssize_t _ft_read(int fd, char* str, size_t count);
char *_ft_strdup(const char *s);
// int _ft_strdup(const char *s);

typedef struct  s_list
{
    void    *data;
    struct s_list   *next;
}   t_list;

void cpyfunct(char *dst, char *src)
{
    strcpy(dst, src);
}

void ft_cpyfunct(char *dst, char *src)
{
    _ft_strcpy(dst, src);
}

int main()
{
    printf ("----------ft_strlen----------\n");
    char *str = "1234567890";
    int l = strlen(str);
    printf("strlen: %d\n", l);
    int len = _ft_strlen(str);
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
    char *ft_ret = _ft_strcpy(ft_dst, ft_src);
    printf("ft_strcpy: >%s< >%s< >%s<\n", ft_ret, ft_dst, ft_src);
    printf("ft_strcpy: %p %p %p %p\n", &ft_ret, &ft_dst, &ft_src, &ft_buffer);
    printf("ft_strcpy: %p\n\n", _ft_strcpy(ft_dst, ft_src));

    char *cpy_src = "dst";
    char *cpy_dst = malloc(sizeof(char) * 10);
    cpyfunct(cpy_dst, cpy_src);
    printf("strcpy: (%s)\n", cpy_dst);
    free(cpy_dst);

    char *ft_cpy_src = "dst";
    char *ft_cpy_dst = malloc(sizeof(char) * 10);
    ft_cpyfunct(ft_cpy_dst, ft_cpy_src);
    printf("ft_strcpy: (%s)", ft_cpy_dst);
    free(ft_cpy_dst);

    printf ("\n\n----------ft_strcmp----------\n");
    char *s1 = "abc";
    char *s2 = "123";
    char *s3 = "acb";
    char *s4 = "abc";
    printf("strcmp: %d %d %d %d\n", strcmp(s1, s2), strcmp(s2,s3), strcmp(s1,s3), strcmp(s1, s4));
    printf("ft_strcmp: %d %d %d %d", _ft_strcmp(s1, s2), _ft_strcmp(s2,s3), _ft_strcmp(s1,s3), _ft_strcmp(s1, s4));

    printf ("\n\n----------ft_write----------\n");
    char *w_str = "testing";
    int w_len = strlen(w_str);
    write(1, "write: ", 8);
    printf(" (%ld) ", write(1, w_str, w_len));
    printf("%s\n", strerror(errno));
    _ft_write(1, "ft_write: ", 11);
    printf(" (%ld) ", _ft_write(1, w_str, w_len));
    printf("%s\n\n", strerror(errno));

    write(1, "error write: ", 14);
    printf(" (%ld) ", write(11, w_str, w_len));
    printf("%s\n", strerror(errno));

    _ft_write(1, "error ft_write: ", 17);
    printf(" (%ld) ", _ft_write(11, w_str, w_len));
    printf("%s", strerror(errno));
    // int fs = write(11, w_str, w_len);
    // printf(" %s %d %d\n", strerror(errno), errno, fs);
    // int ft = write(1, w_str, w_len);
    // printf(" %s %d %d\n", strerror(errno), errno, ft);

    int fd = open("write.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    int w_fd = open("ft_write.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    char *w_writeStr = "writing to file\n";
    int w_writeLen = strlen(w_writeStr);
    write(fd, w_writeStr, w_writeLen);
    _ft_write(w_fd, w_writeStr , w_writeLen);
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
    int r_writeLen = _ft_read(r_writeFd, r_writeBuffer, 100);
    write(1, "ft_read: ", 9);
    write(1, r_writeBuffer, r_writeLen);
    printf("(%d)", r_writeLen);

    close(r_fd);
    close(r_writeFd);

    // char r_ft_buffer[100];
    // int r_ft = _ft_read(1, r_ft_buffer, 100);
    // printf("\n%s %d %d\n", strerror(errno), errno, r_ft);

    printf ("\n\n----------ft_strdup----------\n");
    char *d_str = "abcdefg";
    char *dupped = strdup(d_str);

    printf("strdup: %p %p %s\n", d_str, dupped, dupped);
    free(dupped);

    char *dupped2 = strdup(d_str);
    printf("strdup2: %p %p %s\n", d_str, dupped2, dupped2);
    free(dupped2);

    char *ft_dupped = _ft_strdup(d_str);
    printf("ft_strdup: %p %p %s\n", d_str, ft_dupped, ft_dupped);
    free(ft_dupped);
}