class Main inherits IO{
   newStack : List;
   tempStack : List;
   empty : Bool <- true; 
   a2i : A2I;
   a : String;
   temp1 : Int;
   temp2 : Int;
   temp3 : String;
   temp4 : String;
   
   print_list(l : List) : Object {
      if l.isNil() then out_string("\n")
                   else {
			   out_string(l.head());
			   out_string("\n");
		        }
      fi
   };

   pop_stack(newStack : List) : List{
      newStack.tail()
   };

   main(): Object {{
      a2i <- new A2I;
      newStack <- new List;
      while (empty) loop{
         out_string(">");
         a<-in_string();
         if a = "e" then{
            if newStack.isNil() then{
               out_string("");
            } else
            if newStack.head() = "+" then{
               newStack <- pop_stack(newStack);
               temp1<- a2i.a2i(newStack.head());
               newStack <- pop_stack(newStack);
               temp2<- a2i.a2i(newStack.head());
               newStack <- pop_stack(newStack);
               newStack <- newStack.cons(a2i.i2a(temp1+temp2));
            }else if newStack.head() = "s" then{
               newStack <- pop_stack(newStack);
               temp3<- newStack.head();
               newStack <- pop_stack(newStack);
               temp4<- newStack.head();
               newStack <- pop_stack(newStack);
               newStack <- newStack.cons(temp3);
               newStack <- newStack.cons(temp4);
            }else newStack <- newStack
            fi fi fi;
         }
         else if a = "d" then{
            tempStack <- newStack;
            while (not tempStack.isNil()) loop
               {
                  print_list(tempStack);
                  tempStack <- tempStack.tail();
               }pool;
         }
         else if a = "x" then{
            empty <- false;
         }
         else{
            newStack<-newStack.cons(a);
         } 
         fi fi fi;
      }pool;
   }};
};

class List {
   isNil() : Bool { true };
   head()  : String { { abort(); ""; } };
   tail()  : List { { abort(); self; } };
   cons(i : String) : List {
      (new Cons).init(i, self)
   };

};
class Cons inherits List {

   car : String;	-- The element in this list cell

   cdr : List;	-- The rest of the list

   isNil() : Bool { false };

   head()  : String { car };

   tail()  : List { cdr };

   init(i : String, rest : List) : List {
      {
	 car <- i;
	 cdr <- rest;
	 self;
      }
   };

};


