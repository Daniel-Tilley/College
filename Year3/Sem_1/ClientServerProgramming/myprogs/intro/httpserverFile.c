#include "unp.h"

int main(int argc, char **argv) {

	int listenfd, connfd, n; // Socket Ids; one for listening and one for the connected socket.
	struct sockaddr_in servaddr; // Address structure to hold this server's address.
	char buff[MAXLINE], sendbuff[MAXLINE], recvline[MAXLINE], cmd[16], path[64], vers[16];
	char filepath[64] = {"."};
	int count = 0;
	FILE *fd;

	if (argc != 2) {
		err_quit("Usage: <Program Name><Port No.>\n");
	}//end if


	// Create a socket.
	listenfd = Socket(AF_INET, SOCK_STREAM, 0);

	bzero(&servaddr, sizeof(servaddr)); // Zero and fill in server address structure.
	servaddr.sin_family 		= AF_INET;
	servaddr.sin_addr.s_addr 	= htonl(INADDR_ANY); // Connect to any local ip address.
	servaddr.sin_port 		= htons(atoi(argv[1])); // Daytime server port number;

	// Connects the socket to an external interface.
	Bind(listenfd, (SA *) &servaddr, sizeof(servaddr));

	// Changes the socket to a " Passive listening" socket
	Listen(listenfd, LISTENQ);


	for ( ; ; ) {
		// Accept next connection request.
		connfd = Accept(listenfd, (SA *) NULL, NULL);

		while((n = read(connfd, recvline, MAXLINE)) > 0) {
                	recvline[n] = 0; // Null terminate.

                	if(fputs(recvline, stdout) == EOF) {
                        	err_sys("fputs erorr");
                	}//end if

			if((strstr(recvline, "\r\n\r\n")) != NULL) {
				break;
			}//end if
    }//end while

		// GET /index.html HTTP/1.1
		sscanf(recvline,"%s %s %s", cmd, path, vers);
		strcat(filepath, path);
		printf("Filepath: %s\n", filepath);

		if(strcmp(filepath, "./") == 0)
			strcpy(filepath, "./index.html");

		if((fd = fopen (filepath, "r")) == NULL) {
			//print error
			printf("error 404\n");

			//Write data to buffer
			snprintf(sendbuff, sizeof(sendbuff), "HTTP/1.1 404 Page Not Found \r\nConnection: close\r\n\r\n \r\n");
		}//end if

		else {
			int c;

			while ((c = fgetc(fd)) != EOF) {
				buff[count] = c;
				count++;
			}

			buff[count] = 0;

			//Write data to buffer
			snprintf(sendbuff, sizeof(sendbuff) , "HTTP/1.1 200 OK \r\nConnection: close\r\nContent-Length: 100\r\n\r\n %s \r\n", buff);
		}//end else

		Write(connfd, sendbuff, strlen(sendbuff));

		Close(connfd);
		fclose(fd);
    		count = 0;
		strcpy(filepath, ".");

	}
}
// Note the use of the upper-case letters at the start of the socket primitives names.
// These are wrapper function that include error-checking functionality for each call.
// The actual socket primitives use lower case names.
