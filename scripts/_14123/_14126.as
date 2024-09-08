package _14123
{
   import _1033._12500;
   import _1045.Group;
   import _1045.Label;
   import _1185._1197;
   
   public class _14126 extends Group
   {
      public static var _2418:int = 16;
      
      public static var _2415:int = 16;
      
      public static var _2421:int = 16;
      
      public static var _2412:int = 16;
      
      public static var _2422:int = 10;
      
      public var _14948:int = 88;
      
      public var _6190:Number = 102;
      
      public var _7319:Number = 0.6;
      
      protected var _2512:Group;
      
      public function _14126()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2512 = new Group();
         this._2512.left = 0;
         this._2512.right = 0;
         this._2512.top = 0;
         this._2512.bottom = 0;
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = _2422;
         _loc1_._2419 = _2418;
         _loc1_._2416 = _2415;
         _loc1_._2410 = _2412;
         this._2512.layout = _loc1_;
         addElement(this._2512);
      }
      
      public function _12890(param1:String) : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.text = param1;
         return _loc2_;
      }
      
      public function _14328() : _12500
      {
         var _loc1_:_12500 = new _12500();
         _loc1_.width = 360;
         return _loc1_;
      }
   }
}

