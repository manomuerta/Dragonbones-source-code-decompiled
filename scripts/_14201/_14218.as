package _14201
{
   import _14193._14192;
   import _14193._14194;
   import _14193._14196;
   import flash.geom.Rectangle;
   
   public class _14218 extends _14196 implements _14194, _14192
   {
      public function _14218()
      {
         super("symbol");
      }
      
      public function get _15190() : Rectangle
      {
         return _1699("viewBox") as Rectangle;
      }
      
      public function set _15190(param1:Rectangle) : void
      {
         _15253("viewBox",param1);
      }
      
      public function get _15189() : String
      {
         return _1699("preserveAspectRatio") as String;
      }
      
      public function set _15189(param1:String) : void
      {
         _15253("preserveAspectRatio",param1);
      }
   }
}

