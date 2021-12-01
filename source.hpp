struct Node {
    virtual std::string prettyPrint();
};
class Num : public Node {
};
class Add : public Node {
};

#define YYSTYPE Node*

