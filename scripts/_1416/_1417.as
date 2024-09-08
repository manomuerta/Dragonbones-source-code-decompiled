package _1416
{
   import flash.text.engine.TextLine;
   
   public class _1417
   {
      public var content:TextLine;
      
      public var _9908:int;
      
      public var _9916:int;
      
      public function _1417()
      {
         super();
      }
      
      public function get length() : int
      {
         return this.content == null ? 0 : this.content.atomCount;
      }
   }
}

