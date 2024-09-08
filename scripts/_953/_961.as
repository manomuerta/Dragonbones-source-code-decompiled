package _953
{
   import _1038._1037;
   import _127._142;
   import _51._79;
   import _636.ComicEvent;
   import _721._763;
   import _790._809;
   import _804._803;
   import _804._807;
   import _844._852;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   
   public class _961 extends _960
   {
      public static var _5380:_852 = new _852();
      
      public var _6789:_142;
      
      public var _6791:_142;
      
      public var _5399:_809;
      
      private var _6785:Number;
      
      private var _6784:Number;
      
      public function _961()
      {
         super();
         this._5399 = new _809();
         this._6791 = new _142();
         this._6791.skinName = _803;
         this._6789 = new _142();
         this._6789.skinName = _807;
         this._6789.addEventListener(MouseEvent.CLICK,this._6792);
         this._6791.addEventListener(MouseEvent.CLICK,this._6793);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._5399._6099 = _6780;
         addElement(this._5399);
      }
      
      override public function active() : void
      {
         super.active();
         _4428.addElement(_5380);
      }
      
      override public function _6695(param1:Number, param2:Number) : void
      {
         this._6785 = param1;
         this._6784 = param2;
         super._6695(param1,param2);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._5399.draw(this._6785,this._6784);
         this._5399._6112(_4871 - this._3233 * _6768.zoom / 2);
         this._5399._6113(_4872 - this._3231 * _6768.zoom / 2);
         this._5399._6106(_6768.zoom,param1,param2);
      }
      
      override public function get _3233() : Number
      {
         return _2000.width;
      }
      
      override public function get _3231() : Number
      {
         return _2000.height;
      }
      
      private function _6792(param1:MouseEvent) : void
      {
         dispatchEvent(new ComicEvent(ComicEvent.OPEN_ANIMATION));
      }
      
      private function _6793(param1:MouseEvent) : void
      {
         dispatchEvent(new ComicEvent(ComicEvent.ADD_ANIMATION));
      }
      
      override protected function _2476() : void
      {
         if(_6778)
         {
            _6778 = false;
            _5350.dataProvider = new _1037();
         }
         if(_6790)
         {
            _6790 = false;
            this._3345();
         }
      }
      
      override public function set _5268(param1:_79) : void
      {
         if(_5366._1837 == param1)
         {
            return;
         }
         _5366._1837 = param1;
         _5086._5056._5021 = param1;
      }
      
      override public function _5340() : void
      {
         super._5340();
         _2000 = _3286._4409[_2762];
         if(_2000 == null)
         {
            _2000 = _763._5941();
         }
      }
      
      override public function _3345() : void
      {
         super._3345();
         this._5399._2000 = _2000;
      }
      
      override public function _6788() : void
      {
         _6790 = true;
         _2466();
      }
      
      public function set _3233(param1:Number) : void
      {
         if(_2000.width != param1)
         {
            _2000.width = param1;
            this._6788();
         }
      }
      
      public function set _3231(param1:Number) : void
      {
         if(_2000.height != param1)
         {
            _2000.height = param1;
            this._6788();
         }
      }
      
      public function get _4066() : uint
      {
         return _2000.bgColor;
      }
      
      public function set _4066(param1:uint) : void
      {
         if(_2000.bgColor != param1)
         {
            _2000.bgColor = param1;
            this._6788();
         }
      }
      
      public function _3114(param1:Matrix) : void
      {
         this._6789.transform.matrix = param1;
         _4428.addElement(this._6789);
      }
      
      public function _5381() : void
      {
         if(this._6789.parent)
         {
            _4428.removeElement(this._6789);
         }
      }
      
      public function _3115(param1:Matrix) : void
      {
         this._6791.transform.matrix = param1;
         _4428.addElement(this._6791);
      }
      
      public function _5383() : void
      {
         if(this._6791.parent)
         {
            _4428.removeElement(this._6791);
         }
      }
   }
}

