FROM anapsix/alpine-java
LABEL maintainer="danil@mail.com"
COPY /target/spring-petclinic-2.5.0-SNAPSHOT.jar /home/spring-petclinic-2.5.0-SNAPSHOT.jar
CMD ["java","-jar","/home/spring-petclinic-2.5.0-SNAPSHOT.jar"]
