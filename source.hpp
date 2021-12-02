#include <string>

typedef enum reloptype {
    EQUALS,
    NOT_EQUALS,
    SMALLER,
    BIGGER,
    SMALLER_EQUALS,
    BIGGER_EQUALS
};
typedef enum binoptype {
    PLUS,
    MINUS,
    MUL,
    DIV
};

struct Node {
    
    virtual std::string prettyPrint();
};

class Relop : public Node {
    enum reloptype type;
    Relop(std::string value) {
        if(value == "<") type = SMALLER;
        else if(value == ">") type = BIGGER;
        else if(value == ">=") type = BIGGER_EQUALS;
        else if(value == "<=") type = SMALLER_EQUALS;
        else if(value == "==") type = EQUALS;
        else if(value == "!=") type = NOT_EQUALS;
        else throw std::invalid_argument("wrong Relop");
    }
};
class Binop : public Node {
    enum binoptype type;
    Binop(std::string value) {
        if (value == "+") type = PLUS;
        else if (value == "-") type = MINUS;
        else if (value == "*") type = MUL;
        else if (value == "/") type = DIV;
        else throw std::invalid_argument("wrong Binop");
    }
};
class ID : public Node {
    std::string value;
    ID(std::string text) : value(text) {}
};

class Num : public Node {
private:
    std::string value;
public:
    Num(std::string text) : value(text) {}
    long long getNumber() {
        return std::stoll(value);
    }
};

class String : public Node {
    std::string value;
    String(std::string text) : value(text) {}
};

#define YYSTYPE Node*

