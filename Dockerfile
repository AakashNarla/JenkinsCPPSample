FROM gcc:5
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN pip --version
COPY gcovr-3.2.tar.gz .
RUN pip install gcovr-3.2.tar.gz

RUN python --version
