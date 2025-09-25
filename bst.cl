(* 节点类 *)
class Node {
  key   : Int;   -- 节点值
  left  : Node;  -- 左子树
  right : Node;  -- 右子树

  init(k : Int) : Node {
    {
      key <- k;
      self;  
    }
  };

  (* 插入一个新值到子树里 *)
  insert(v : Int) : Node {
    {
      if v < key then
        if isvoid left then
          left <- (new Node).init(v)
        else
          left.insert(v)
        fi
      else
        if isvoid right then
          right <- (new Node).init(v)
        else
          right.insert(v)
        fi
      fi;
      self;
    }
  };

  (* 中序遍历: 左 -> 根 -> 右 *)
  inorder() : Object {
    {
      if not isvoid left then left.inorder() else 0 fi;
      (new IO).out_int(key).out_string(" ");
      if not isvoid right then right.inorder() else 0 fi;
    }
  };
};


class Tree {
  root : Node;  -- 默认 void

  init() : Tree { self };

  insert(v : Int) : Tree {
    {
      if isvoid root then
        root <- (new Node).init(v)
      else
        root.insert(v)
      fi;
      self;
    }
  };

  inorder() : Object {
    if isvoid root then
      (new IO).out_string("empty\n")
    else
      root.inorder()
    fi
  };
};


class Main {
  main() : Int {
    let t : Tree <- (new Tree).init() in {
      t.insert(5).insert(3).insert(7).insert(1).insert(4).insert(6).insert(8);

      (new IO).out_string("Inorder: ");
      t.inorder();
      (new IO).out_string("\n");

      0;
    }
  };
};
