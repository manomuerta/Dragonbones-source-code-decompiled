package _14101
{
   import _1038._1037;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045._1046;
   import _1177.UIEvent;
   import _1185._1188;
   import _1185._1189;
   import _1185._1197;
   import _127._128;
   import _127._171;
   import _1404._1407;
   import _214._213;
   import _521._12460;
   import _97._125;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class _14104 extends _171
   {
      private const WIDTH:int = 245;
      
      private const HEIGHT:int = 310;
      
      private var _14779:Array;
      
      private var _6877:_1037;
      
      private var _6028:_1046;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      private var flag:uint;
      
      public function _14104()
      {
         super();
         this.width = this.minWidth = this.WIDTH;
         this.height = this.minHeight = this.HEIGHT;
         title = tr("MenuItem-selectivePaste");
      }
      
      override protected function _2438() : void
      {
         var _loc5_:_128 = null;
         var _loc8_:Object = null;
         super._2438();
         closeButton.visible = true;
         var _loc1_:Label = new Label();
         _loc1_.top = 15;
         _loc1_.left = 30;
         _loc1_.text = tr("SelectivePaste.selectPasteContents");
         addElement(_loc1_);
         this._14779 = [_14103.CHILD_BONE,_14103.SLOT,_14103.DISPLAY,_14103.MESH,_14103.WEIGHT,_14103.KEYFRAMES];
         this._6028 = new _1046();
         this._6877 = new _1037();
         this._6028.dataProvider = this._6877;
         var _loc2_:_1197 = new _1197();
         _loc2_._2401 = _1188.LEFT;
         this._6028.left = 50;
         this._6028.top = 40;
         this._6028.layout = _loc2_;
         this._6028.itemRenderer = _14100;
         this._6028.addEventListener(UIEvent.VALUE_COMMIT,this._14778);
         this.addElement(this._6028);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._14779.length);
         switch(_213.type)
         {
            case _213.TYPE_SLOT:
               _loc3_ = 2;
               break;
            case _213.TYPE_DISPLAY:
               _loc3_ = 3;
               _loc4_ = int(this._14779.length);
         }
         while(_loc3_ < _loc4_)
         {
            (_loc8_ = new Object()).label = _14103._14776(this._14779[_loc3_]);
            _loc8_.selected = true;
            _loc8_.enabled = true;
            _loc8_.type = this._14779[_loc3_];
            this._6877.addItem(_loc8_);
            _loc3_++;
         }
         var _loc6_:Group;
         (_loc6_ = _125._11551()).percentWidth = 100;
         _loc6_.percentHeight = 100;
         var _loc7_:_1189;
         (_loc7_ = _loc6_.layout as _1189).padding = 20;
         _loc7_._2410 = 15;
         this._5554 = _125._14329();
         this._5555 = _125._2406();
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
         this._5554.addEventListener(MouseEvent.CLICK,this._7060);
         _loc6_.addElement(this._5555);
         _loc6_.addElement(this._5554);
         addElement(_loc6_);
      }
      
      private function _7060(param1:MouseEvent) : void
      {
         this._12624.selectivePaste(this.flag);
         close();
      }
      
      private function _14778(param1:UIEvent) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:int = 0;
         var _loc2_:_14100 = param1.target as _14100;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Object = _loc2_.data;
         var _loc4_:Boolean = _loc2_._6492.selected;
         var _loc5_:Boolean = _loc2_._6492.enabled;
         this._14777(_loc3_.type,_loc4_);
         _loc3_.selected = _loc4_;
         _loc3_.enabled = _loc5_;
         _loc6_ = 0;
         while(_loc6_ < this._6877.length)
         {
            _loc7_ = this._6877[_loc6_];
            if(_loc7_.type == _14103.DISPLAY || _loc7_.type == _14103.MESH || _loc7_.type == _14103.WEIGHT)
            {
               _loc9_ = _loc6_ - 1;
               if(_loc9_ >= 0)
               {
                  _loc8_ = this._6877[_loc9_];
                  _loc7_.enabled = _loc8_.selected;
                  if(!_loc8_.selected)
                  {
                     _loc7_.selected = _loc8_.selected;
                  }
               }
            }
            _loc6_++;
         }
         var _loc10_:_1037 = new _1037();
         _loc6_ = 0;
         while(_loc6_ < this._6877.length)
         {
            _loc10_.addItemAt(this._6877[_loc6_],_loc6_);
            _loc6_++;
         }
         this._6028.dataProvider = _loc10_;
      }
      
      private function _14777(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            this.flag |= param1;
         }
         else
         {
            this.flag &= ~param1;
         }
      }
      
      private function get _12624() : _12460
      {
         return _1407.getInstance(_12460) as _12460;
      }
   }
}

