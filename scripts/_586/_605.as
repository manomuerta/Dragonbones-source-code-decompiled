package _586
{
   import _1404._1407;
   import _214._213;
   import _24.Shortcut;
   import _24._26;
   import _470._469;
   import _472._473;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._523;
   import _555._556;
   import _636.ComicEvent;
   import _644._643;
   import _644._645;
   import _644._646;
   import _710._711;
   import _710._712;
   import _721._763;
   import _724._731;
   import _783.ComicNotification;
   import _783.CommandNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _81._82;
   import _81._86;
   import _81._88;
   import _81._91;
   import _953._961;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class _605 extends _603
   {
      public static const MAX_COMIC_WIDTH:int = 2048;
      
      public static const MAX_COMIC_HEIGHT:int = 2048;
      
      private const SHOW_CAMERA_TIME:int = 200;
      
      private var _5378:_643;
      
      private var _5034:_523;
      
      private var _5028:_590;
      
      private var _5392:_86;
      
      private var _2205:Matrix;
      
      private var _5389:Boolean;
      
      private var _5384:Timer;
      
      private var _5379:_79;
      
      public var _3055:_473;
      
      public function _605()
      {
         this._3055 = _1407.getInstance(_473) as _473;
         super();
         this._5034 = _1407.getInstance(_523) as _523;
         this._5028 = _1407.getInstance(_590) as _590;
         this._5028._4313 = _961._5380;
         this._5392 = new _86();
         this._2205 = new Matrix();
         this._5384 = new Timer(this.SHOW_CAMERA_TIME,1);
      }
      
      override public function _4858() : void
      {
         _82.clearCache();
         var _loc1_:_50 = _5141._2762;
         var _loc2_:Rectangle = _82._2182(_loc1_._1779,_loc1_._1780,[this._5394._5399]);
         var _loc3_:Number = (_5141.width - 10) / _loc2_.width;
         var _loc4_:Number = (_5141.height - 10) / _loc2_.height;
         var _loc5_:Number = _loc3_ < _loc4_ ? _loc3_ : _loc4_;
         _4856(new Point(-_loc5_ * ((_loc2_.width - _5141._3233) / 2 + _loc2_.x),-_loc5_ * ((_loc2_.height - _5141._3231) / 2 + _loc2_.y)));
         _4857(_loc5_);
      }
      
      private function get _5394() : _961
      {
         return _5141 as _961;
      }
      
      public function get _4049() : _763
      {
         return this._5394._2000;
      }
      
      override public function start() : void
      {
         super.start();
         _3058.start();
         if(_5141._2762)
         {
            if(this._5378 == null)
            {
               this._5378 = new _643(_5141._2762);
            }
            _3058._5051 = this._5378;
         }
         this._3056.refresh();
         this._3055.start();
         this._5028.start();
         _3058._5088(this._4049.width,this._4049.height);
      }
      
      override protected function _5129(param1:MouseEvent) : void
      {
      }
      
      override protected function dispose() : void
      {
         this._5378 = null;
         this._5034._2986(null);
         this._5034._3053 = null;
         super.dispose();
         _3058.stop();
         this._5028.stop();
         _1564(ComicNotification.UPDATE_SELCTEDS,this._5382);
         _1564(StageNotification.UPDATE_SELECTED_ITEMS,this._5306);
         _1564(StageNotification.UPDATE_LIBRARY,this._5395);
         _1564(StageNotification.DRAG_IAMGE_TO_STAGE,this._5375);
         _1564(ComicNotification.PREVIEW_START,this._5391);
         _1564(ComicNotification.PREVIEW_END,this._5397);
         _1564(ComicNotification.SHOW_ANIMATION,this._5387);
         _1564(ComicNotification.IMPORT_ASSETS_TO_STAGE,this._5377);
         _5141.removeEventListener(ComicEvent.OPEN_ANIMATION,this._5386);
         _5141.removeEventListener(ComicEvent.ADD_ANIMATION,this._5393);
         Shortcut._1673(stage,_26.COPY,this._4734);
         Shortcut._1673(stage,_26.CUT,this._4742);
         Shortcut._1673(stage,_26.PASTE,this._4726);
         Shortcut._1673(stage,_26.BRING_FORWARD,this._4128);
         Shortcut._1673(stage,_26.SEND_BACKWARD,this._4128);
         Shortcut._1673(stage,_26.BRING_TO_FRONT,this._4128);
         Shortcut._1673(stage,_26.SEND_TO_BOTTOM,this._4128);
         stage.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._5385);
         stage.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._5396);
         this._5384.removeEventListener(TimerEvent.TIMER_COMPLETE,this._5388);
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(ComicNotification.UPDATE_SELCTEDS,this._5382,100);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._5306,100);
         _1565(StageNotification.UPDATE_LIBRARY,this._5395);
         _1565(StageNotification.DRAG_IAMGE_TO_STAGE,this._5375);
         _1565(ComicNotification.PREVIEW_START,this._5391);
         _1565(ComicNotification.PREVIEW_END,this._5397);
         _1565(ComicNotification.SHOW_ANIMATION,this._5387);
         _1565(ComicNotification.IMPORT_ASSETS_TO_STAGE,this._5377);
         _5141.addEventListener(ComicEvent.OPEN_ANIMATION,this._5386);
         _5141.addEventListener(ComicEvent.ADD_ANIMATION,this._5393);
         Shortcut._1681(stage,_26.COPY,this._4734);
         Shortcut._1681(stage,_26.CUT,this._4742);
         Shortcut._1681(stage,_26.PASTE,this._4726);
         Shortcut._1681(stage,_26.BRING_FORWARD,this._4128);
         Shortcut._1681(stage,_26.SEND_BACKWARD,this._4128);
         Shortcut._1681(stage,_26.BRING_TO_FRONT,this._4128);
         Shortcut._1681(stage,_26.SEND_TO_BOTTOM,this._4128);
         stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._5385);
         stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._5396);
         this._5384.addEventListener(TimerEvent.TIMER_COMPLETE,this._5388);
      }
      
      private function _5388(param1:TimerEvent) : void
      {
         this._5394._5399._5401();
      }
      
      private function _5396(param1:MouseEvent) : void
      {
         this._5384.stop();
         this._5394._5399._5400();
      }
      
      private function _5385(param1:MouseEvent) : void
      {
         this._5384.reset();
         this._5384.start();
      }
      
      private function _4726() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:Point = null;
         var _loc4_:_79 = null;
         var _loc5_:_70 = null;
         var _loc6_:_70 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Point = null;
         if(_213.type == _213.TYPE_COMIC_SLOT)
         {
            _loc1_ = [];
            _loc2_ = [];
            _loc7_ = 0;
            _loc8_ = int(_213._2837.length);
            while(_loc7_ < _loc8_)
            {
               _loc4_ = _213._2837[_loc7_];
               if((Boolean(_loc4_)) && Boolean(_loc4_._2049))
               {
                  if(_loc3_ == null)
                  {
                     _loc3_ = new Point();
                     _loc3_.x = _loc4_.globalTransform.x;
                     _loc3_.y = _loc4_.globalTransform.y;
                  }
                  _loc5_ = _loc4_._2049;
                  _loc6_ = _70._2090(_loc5_._2104);
                  _loc1_.push(_loc6_);
                  (_loc9_ = new Point()).x = _loc4_.globalTransform.x - _loc3_.x + stage.mouseX;
                  _loc9_.y = _loc4_.globalTransform.y - _loc3_.y + stage.mouseY;
                  _loc2_.push(_loc9_);
               }
               _loc7_++;
            }
            if(_loc1_.length > 0)
            {
               this._5342(_loc1_,_loc2_);
            }
         }
      }
      
      private function _4742() : void
      {
         if(this._5034._3050.length > 0)
         {
            _213._2834(this._5034._3050);
            _1567(new PanelNotification(PanelNotification.SCENE_PANEL_DELETE_ITEM));
         }
      }
      
      private function _4734() : void
      {
         if(this._5034._3050.length > 0)
         {
            _213._2834(this._5034._3050);
         }
      }
      
      private function _5387(param1:ComicNotification) : void
      {
         if(!this._5389)
         {
            this._5389 = true;
            this._3115();
         }
      }
      
      private function _5393(param1:ComicEvent) : void
      {
         _3975._3934(_711.COMIC,_712.ADD_TWEEN);
      }
      
      private function _5386(param1:ComicEvent) : void
      {
         _1567(new ComicNotification(ComicNotification.SHOW_ANIMATION,true));
      }
      
      private function _5397(param1:ComicNotification) : void
      {
         _1567(new ComicNotification(ComicNotification.SHOW_ANIMATION,false));
         this._3060();
      }
      
      private function _5391(param1:ComicNotification) : void
      {
         if(this._5394)
         {
            this._5394._5381();
            this._5394._5383();
         }
      }
      
      private function _5375(param1:StageNotification) : void
      {
         var _loc2_:_731 = null;
         if(Boolean(param1.data.imageFile) && Boolean(param1.data.position))
         {
            _loc2_ = param1.data.imageFile;
            if(_loc2_ && _loc2_.bitmapData.width <= MAX_COMIC_WIDTH && _loc2_.bitmapData.height <= MAX_COMIC_HEIGHT)
            {
               this._5342([_70._2090(param1.data.imageFile)],[param1.data.position]);
            }
         }
      }
      
      private function _5377(param1:ComicNotification) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Point = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_731 = null;
         var _loc9_:_70 = null;
         var _loc2_:Array = param1.data as Array;
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc3_ = [];
            _loc4_ = [];
            _loc5_ = _5141._4428.localToGlobal(new Point());
            _loc6_ = 0;
            _loc7_ = int(_loc2_.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = _loc2_[_loc6_];
               if((_loc8_) && _loc8_.bitmapData.width <= MAX_COMIC_WIDTH && _loc8_.bitmapData.height <= MAX_COMIC_HEIGHT)
               {
                  _loc9_ = _70._2090(_loc8_);
                  if(_loc9_)
                  {
                     _loc3_.push(_loc9_);
                     _loc4_.push(_loc5_);
                  }
               }
               _loc6_++;
            }
            if(_loc3_.length > 0)
            {
               this._5342(_loc3_,_loc4_);
            }
         }
      }
      
      public function _3051() : void
      {
         this._5378._3051();
         _3058._5051 = this._5378;
         _3058._5088(this._4049.width,this._4049.height);
      }
      
      private function _5395(param1:StageNotification) : void
      {
         _3058._5051 = this._5378;
      }
      
      private function _5306(param1:StageNotification) : void
      {
      }
      
      private function _5382(param1:ComicNotification) : void
      {
         if(this._5034._2889.length > 0)
         {
            if(this._5034._3050.length > 0)
            {
               if(this._5379 != this._5034._3050[0])
               {
                  this._5390();
               }
            }
            if(!this._5389)
            {
               this._3114();
            }
            else
            {
               if(this._5034._3050.length > 0)
               {
                  _1567(new ComicNotification(ComicNotification.SHOW_ANIMATION,false));
               }
               this._3115();
            }
            if(this._5034._2889[0] is _79)
            {
               this._5379 = this._5034._2889[0] as _79;
            }
            else if(this._5034._2889[0] is _646)
            {
               this._5379 = (this._5034._2889[0] as _646)._1837;
            }
         }
         else
         {
            this._5390();
            this._5379 = null;
         }
      }
      
      private function _5390() : void
      {
         if(this._5394)
         {
            this._5394._5381();
         }
         if(this._5389)
         {
            this._5389 = false;
            _1567(new ComicNotification(ComicNotification.HIDE_ANIMATION));
            if(this._5394)
            {
               this._5394._5383();
            }
         }
      }
      
      public function _3119() : void
      {
         if(this._5394)
         {
            this._5394._5399.refresh();
         }
      }
      
      override public function _3387(param1:Number, param2:Point) : void
      {
         super._3387(param1,param2);
         if(this._5034._2889.length == 0)
         {
            return;
         }
         this._5028._1751();
         this._3114();
         this._3115();
      }
      
      override public function _10459(param1:Number) : void
      {
         super._10459(param1);
         if(this._5034._2889.length == 0)
         {
            return;
         }
         this._5028._1751();
         this._3114();
         this._3115();
      }
      
      public function _3114() : void
      {
         var _loc1_:_79 = null;
         var _loc2_:_645 = null;
         if(this._5389)
         {
            return;
         }
         if(this._5034._2889.length > 0)
         {
            if(this._5034._2889[0] is _79)
            {
               _loc1_ = this._5034._2889[0] as _79;
               _loc2_ = this._5378._3116(_loc1_.parentBoneData,_loc1_);
               if(_loc2_ == null || _loc2_.tracks.length == 0)
               {
                  if(this._5394)
                  {
                     this._5394._5381();
                  }
                  return;
               }
               if(this._5394)
               {
                  this._5394._3114(this._5398());
               }
               return;
            }
         }
         if(this._5394)
         {
            this._5394._5381();
         }
      }
      
      public function _3115() : void
      {
         var _loc1_:_79 = null;
         var _loc2_:_645 = null;
         if(this._5389 && this._5034._2889.length > 0)
         {
            if(this._5034._3050.length > 0)
            {
               _loc1_ = this._5034._3050[0];
               if(Boolean(_loc1_) && Boolean(_loc1_.parentBoneData))
               {
                  _loc2_ = this._5378._3116(_loc1_.parentBoneData,_loc1_);
                  if(Boolean(_loc2_) && _loc2_.tracks.length == 0)
                  {
                     this._5394._5383();
                     return;
                  }
               }
            }
            if(this._5394)
            {
               this._5394._5381();
               this._5394._3115(this._5398());
            }
         }
      }
      
      public function _3060() : void
      {
         if(this._5034._2889.length == 0)
         {
            return;
         }
         if(!this._5389)
         {
            this._5389 = true;
         }
         this._3115();
      }
      
      private function _5398() : Matrix
      {
         var _loc1_:_91 = null;
         var _loc2_:Number = NaN;
         var _loc3_:Point = null;
         var _loc4_:_86 = null;
         if(this._5034._2889.length > 0)
         {
            _loc1_ = this._5034._2889[0];
            if(_loc1_ is _646)
            {
               _loc4_ = (_loc1_ as _646).transform;
            }
            this._2205.copyFrom(_loc1_._2009);
            _loc2_ = 100;
            if(_loc1_ is _79)
            {
               if((_loc1_ as _79)._2049)
               {
                  _loc2_ = (_loc1_ as _79)._2049.height;
               }
            }
            else if(_loc1_ is _646)
            {
               if(Boolean((_loc1_ as _646)._1837) && Boolean((_loc1_ as _646)._1837._2049))
               {
                  _loc2_ = (_loc1_ as _646)._1837._2049.height;
               }
            }
            _loc3_ = new Point(0,_loc2_ / 2 + 12 / _2580);
            this._2205.tx = 0;
            this._2205.ty = 0;
            _loc3_ = this._2205.transformPoint(_loc3_);
            this._5392.copyFrom(_loc1_.globalTransform);
            this._5392.scaleX = 1;
            this._5392.scaleY = 1;
            _88._2013(this._5392,this._2205);
            this._2205.a = 1;
            this._2205.b = 0;
            this._2205.c = 0;
            this._2205.d = 1;
            this._2205.tx += _loc3_.x;
            this._2205.ty += _loc3_.y;
            this._2205.tx *= _2580;
            this._2205.ty *= _2580;
         }
         return this._2205;
      }
      
      public function _2064() : void
      {
         var _loc1_:Boolean = this._5378._1992._2064();
         if(_loc1_)
         {
            _1567(new ComicNotification(ComicNotification.UPDATE_STRIP));
         }
      }
      
      override protected function _4023(param1:StageNotification) : void
      {
         _5333._5306();
         _5350._5374(_2226._2889);
         _5141._5373();
         _5333._5306();
         _4222();
      }
      
      override protected function _5342(param1:Array, param2:Array, param3:Boolean = false) : void
      {
         var _3410:Array = null;
         var _11129:Object = null;
         var _1836:_52 = null;
         var _1837:_79 = null;
         var displayVO:_70 = null;
         var pos:Point = null;
         var _1886:_50 = null;
         var checkBoneName:Function = null;
         var checkSlotName:Function = null;
         var position:Point = null;
         var _13225:Array = param1;
         var positionList:Array = param2;
         var absPos:Boolean = param3;
         var _1747:Function = function(param1:String, param2:int, param3:Function):String
         {
            var _loc4_:int = 0;
            var _loc5_:String = param1;
            while(param3(_loc5_,param2))
            {
               _loc5_ = param1 + String(++_loc4_);
            }
            return _loc5_;
         };
         checkBoneName = function(param1:String, param2:int):Boolean
         {
            var _loc3_:int = 0;
            var _loc4_:int = int(_3410.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc3_ != param2 && _3410[_loc3_]._1836 && _3410[_loc3_]._1836.name == param1)
               {
                  return true;
               }
               _loc3_++;
            }
            return _1886._1793(param1);
         };
         checkSlotName = function(param1:String, param2:int):Boolean
         {
            var _loc3_:int = 0;
            var _loc4_:int = int(_3410.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc3_ != param2 && _3410[_loc3_]._1837 && _3410[_loc3_]._1837.name == param1)
               {
                  return true;
               }
               _loc3_++;
            }
            return _1886._1996(param1);
         };
         _3410 = [];
         var forceNewLayer:Boolean = _13225.length > 1;
         var centerP:Point = _5141._4428.localToGlobal(new Point());
         _1886 = _5141._2762;
         var i:int = 0;
         var len:int = int(_13225.length);
         while(i < len)
         {
            displayVO = _13225[i];
            pos = positionList[i];
            if(absPos)
            {
               position = pos;
            }
            else
            {
               position = new Point((pos.x - centerP.x) / _2580,(pos.y - centerP.y) / _2580);
            }
            _11129 = _469._3474(displayVO,_5141._2762._1795.name,_5141._2762,_5141._2762._1990,position);
            _3410.push(_11129);
            i++;
         }
         len = int(_3410.length);
         if(len > 1)
         {
            i = 0;
            while(i < len)
            {
               _3410[i]._1836.name = _1747(_3410[i]._1836.name,i,checkBoneName);
               _3410[i]._1837.name = _1747(_3410[i]._1837.name,i,checkSlotName);
               i++;
            }
         }
         _1567(new CommandNotification(CommandNotification.ADD_COMICOBJECTS_TO_STAGE,_3410));
      }
      
      override public function _2881(param1:_52, param2:Boolean = true) : void
      {
         _2762._1751();
      }
      
      private function _4128(param1:String) : void
      {
         switch(param1)
         {
            case _26.BRING_FORWARD:
               this._4134(true);
               break;
            case _26.SEND_BACKWARD:
               this._4134(false);
               break;
            case _26.BRING_TO_FRONT:
               this._4134(true,true);
               break;
            case _26.SEND_TO_BOTTOM:
               this._4134(false,true);
         }
      }
      
      private function _4134(param1:Boolean, param2:Boolean = false) : void
      {
         var _loc3_:Array = null;
         var _loc4_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:_79 = null;
         var _loc12_:Object = null;
         var _loc7_:Vector.<_91> = this._5034._2889.concat();
         if(_loc7_.length > 0)
         {
            _loc3_ = (_loc7_[0] as _79).parentBoneData.rootArmatureData._1780;
            _loc5_ = int(_loc3_.length);
            if(!param1 && _loc3_.indexOf(_loc7_[_loc7_.length - 1]) != 0 || param1 && _loc3_.indexOf(_loc7_[0]) != _loc5_ - 1)
            {
               _loc8_ = [];
               _loc9_ = [];
               _loc10_ = [];
               for each(_loc11_ in _loc7_)
               {
                  _loc4_ = _loc11_;
                  _loc6_ = _loc5_ - _loc3_.indexOf(_loc4_) - 1;
                  if(param1)
                  {
                     _loc8_.unshift(_loc4_);
                     if(param2)
                     {
                        _loc9_.unshift(0);
                     }
                     else
                     {
                        _loc9_.unshift(_loc6_ - 1);
                     }
                     _loc10_.push(_loc6_);
                  }
                  else
                  {
                     _loc8_.push(_loc4_);
                     if(param2)
                     {
                        _loc9_.push(_loc3_.length - 1);
                     }
                     else
                     {
                        _loc9_.push(_loc6_ + 1);
                     }
                     _loc10_.unshift(_loc6_);
                  }
               }
               if(_loc8_.length > 0)
               {
                  _loc12_ = _469._3473(_loc8_,_loc9_,_loc10_);
                  _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_SLOT_ITEMS_ZORDER,_loc12_));
               }
            }
         }
      }
      
      public function get _3567() : _643
      {
         return this._5378;
      }
      
      public function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
      
      public function get _5116() : Boolean
      {
         return this._5389;
      }
      
      override public function _3379(param1:Number, param2:Point) : Point
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:_961 = _5141 as _961;
         if(_loc5_)
         {
            _loc3_ = _loc5_._3233;
            _loc4_ = _loc5_._3231;
         }
         var _loc6_:Number = (_3286.zoom - param1) / _3286.zoom;
         var _loc7_:Point;
         (_loc7_ = new Point()).x = param2.x - _loc3_ / 2 * _3286.zoom;
         _loc7_.y = param2.y - _loc4_ / 2 * _3286.zoom;
         var _loc8_:Number = _5141._4871 + _loc7_.x * _loc6_;
         var _loc9_:Number = _5141._4872 + _loc7_.y * _loc6_;
         return new Point(_loc8_,_loc9_);
      }
   }
}

