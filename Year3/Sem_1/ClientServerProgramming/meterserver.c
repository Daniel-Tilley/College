//Daniel Tilley
//C14337041
#include "unp.h"

int main(int argc, char **argv) {

	int listenfd, connfd, n; // Socket Ids; one for listening and one for the connected socket.
	struct sockaddr_in servaddr; // Address structure to hold this server's address.
	char sendbuff[MAXLINE], recvline[MAXLINE]; // Buffers

	//checks if number of arguments is greater than 2
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
		
		//loop while data is being received
		while((n = read(connfd, recvline, MAXLINE)) > 0) {
            recvline[n] = 0; // Null terminate.
			
			//check if data recieved in buffer
            if(fputs(recvline, stdout) == EOF) {
                err_sys("fputs erorr");
            }//end if
			
			//Check if there is a reading in the buffer 
			if((strstr(recvline, "Reading:")) != NULL) {
				break;
			}//end if
        }//end while
		
		//Code found online to get int from a string
		int total_n = 0;
		int n;
		int reading_amount;
		
		while (1 == sscanf(recvline + total_n, "%*[^0123456789]%d%n", &reading_amount, &n)){
			total_n += n;
		}//end while
		
		//calculate total
		float total_cost = (float)reading_amount * 1.3;
		
		//Add total to buffer
		snprintf(sendbuff, sizeof(sendbuff), "Units: %d , Cost: %.2f\r\n", reading_amount, total_cost);
		
		// Write data to the client.
		Write(connfd, sendbuff, strlen(sendbuff));
		
		//print data to screen and flush buffer
		printf("Written: %s\n", sendbuff);
		fflush(stdout);
		
		//close connection
		Close(connfd);
	}//end infinite for loop
}//end main