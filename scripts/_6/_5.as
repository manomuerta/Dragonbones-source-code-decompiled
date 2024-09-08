package _6
{
   import _2._3;
   import flash.display.Stage;
   
   public class _5
   {
      private static var _context:Context = Context.getInstance();
      
      public function _5()
      {
         super();
      }
      
      public function _1565(param1:String, param2:Function, param3:int = 0) : void
      {
         _context.addEventListener(param1,param2,false,param3,true);
      }
      
      public function _1564(param1:String, param2:Function) : void
      {
         _context.removeEventListener(param1,param2);
      }
      
      public function _1566(param1:String) : Boolean
      {
         return _context.hasEventListener(param1);
      }
      
      public function _1567(param1:_9) : Boolean
      {
         return _context._1567(param1);
      }
      
      public function get stage() : Stage
      {
         return _context.stage;
      }
      
      public function get _1568() : *
      {
         return _context._1568;
      }
      
      public function get _1559() : _3
      {
         return _context._1559;
      }
   }
}

