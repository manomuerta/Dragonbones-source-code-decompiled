package _18
{
   public interface IAction
   {
      function get _1799() : String;
      
      function get _11209() : Boolean;
      
      function finish() : void;
      
      function get _1637() : Boolean;
      
      function get _1631() : Boolean;
      
      function get _1642() : *;
      
      function set _1642(param1:*) : void;
      
      function get _1634() : *;
      
      function set _1634(param1:*) : void;
      
      function get _1639() : Boolean;
      
      function set _1639(param1:Boolean) : void;
      
      function undo() : void;
      
      function redo() : void;
      
      function merge(param1:IAction) : Boolean;
      
      function clearCache() : void;
   }
}

