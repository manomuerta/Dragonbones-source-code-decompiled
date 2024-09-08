package _13555
{
   import _1045.Group;
   import _1278._1277;
   import _1374.IconButton;
   import _1439._1454;
   
   public class _13561 extends _1277
   {
      public var _8180:IconButton;
      
      public var _8179:IconButton;
      
      public var _2440:Group;
      
      public function _13561()
      {
         super();
         this.minWidth = 150;
         this.minHeight = 30;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2440 = new Group();
         this._2440.left = 0;
         this._2440.right = 0;
         this._2440.top = 0;
         addElement(this._2440);
         this._8180 = new IconButton();
         this._8180.skinName = _1454;
         this._8180.verticalCenter = 0;
         this._8180.left = -26;
         this._8180.icon = "/assets/psdGride/left.png";
         addElement(this._8180);
         this._8179 = new IconButton();
         this._8179.skinName = _1454;
         this._8179.verticalCenter = 0;
         this._8179.right = -26;
         this._8179.icon = "/assets/psdGride/right.png";
         addElement(this._8179);
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
   }
}

