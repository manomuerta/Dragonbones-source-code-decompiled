package _14201
{
   import _14193._14194;
   import _14193._14195;
   import _14193._14196;
   import flash.geom.Rectangle;
   
   public class SVG extends _14196 implements _14195, _14194
   {
      public function SVG()
      {
         super("svg");
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
      
      public function get _15196() : String
      {
         return _1699("x") as String;
      }
      
      public function set _15196(param1:String) : void
      {
         _15253("x",param1);
      }
      
      public function get _15197() : String
      {
         return _1699("y") as String;
      }
      
      public function set _15197(param1:String) : void
      {
         _15253("y",param1);
      }
      
      public function get _15195() : String
      {
         return _1699("width") as String;
      }
      
      public function set _15195(param1:String) : void
      {
         _15253("width",param1);
      }
      
      public function get _15194() : String
      {
         return _1699("height") as String;
      }
      
      public function set _15194(param1:String) : void
      {
         _15253("height",param1);
      }
      
      public function get _15193() : String
      {
         return _1699("overflow") as String;
      }
      
      public function set _15193(param1:String) : void
      {
         _15253("overflow",param1);
      }
   }
}

