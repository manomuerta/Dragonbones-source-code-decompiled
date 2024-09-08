package _586
{
   import _11106._11105;
   import _11111._11110;
   import _13._12;
   import _1404._1407;
   import _24.Shortcut;
   import _470._469;
   import _472._607;
   import _51._50;
   import _51._52;
   import _51._79;
   import _648._665;
   import _755._759;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._82;
   import _81._85;
   import _81._88;
   import _93._94;
   import _953._954;
   import _953._960;
   import _97._124;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _591 extends _94
   {
      public var _1886:_50;
      
      private var _5001:_954;
      
      private var _5141:_960;
      
      private var _4359:Point;
      
      private var _5133:Point;
      
      private var _5142:Boolean;
      
      private var _5139:_52;
      
      private var _5130:Boolean = false;
      
      private var _5131:Boolean = false;
      
      private var _5134:_79;
      
      private var parentBone:_52;
      
      private var _5132:Matrix;
      
      private var autoBindSlot:Boolean;
      
      public function _591()
      {
         this._4359 = new Point();
         this._5133 = new Point();
         super();
      }
      
      override public function start() : void
      {
         super.start();
         this._5142 = true;
      }
      
      override protected function _1576() : void
      {
         super._1576();
         this._5141.addEventListener(MouseEvent.MOUSE_DOWN,this._5129);
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._4126);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4157);
         this._5141.removeEventListener(MouseEvent.MOUSE_DOWN,this._5129);
      }
      
      private function _5129(param1:MouseEvent) : void
      {
         this.autoBindSlot = _2216.autoBindSlot;
         if(!this._5139)
         {
            this._2838();
            this._5130 = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4157);
            stage.addEventListener(MouseEvent.MOUSE_UP,this._4126);
            stage.addEventListener(KeyboardEvent.KEY_DOWN,this._5125);
            stage.addEventListener(KeyboardEvent.KEY_UP,this._5125);
            if(!this._5136)
            {
               this.createBone();
               this._5125();
            }
            param1.stopImmediatePropagation();
         }
      }
      
      private function _4157(param1:MouseEvent = null) : void
      {
         var _loc5_:Object = null;
         var _loc2_:Point = new Point(this._5001.mouseX,this._5001.mouseY);
         _88._2135(_loc2_,this._5132);
         var _loc3_:Point = new Point(_loc2_.x - this._5133.x,_loc2_.y - this._5133.y);
         var _loc4_:Number = _85._2186(_85._2189,_loc3_);
         if(_loc4_ == 0 && _loc3_.x < 0)
         {
            _loc4_ = Math.PI;
         }
         if(this._5139)
         {
            _loc5_ = _469._3480(this._5139,_loc3_.length,_loc4_);
            this._1567(new CommandNotification(CommandNotification.MODIFY_CREATING_BONE,_loc5_));
         }
         else if(_loc3_.length > 10)
         {
            this.createBone(_loc3_.length,_loc4_);
         }
         this._5138(this.autoBindSlot && Boolean(this._5139) && !Shortcut._1677());
      }
      
      private function _4126(param1:MouseEvent) : void
      {
         this._5130 = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4157);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._4126);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._5125);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this._5125);
         if(this._5139)
         {
            _607.instance._5059(true);
            if(this.autoBindSlot)
            {
               if(!Shortcut._1677())
               {
                  if(this._5134)
                  {
                     _1567(new CommandNotification(CommandNotification.SET_SLOTS_PARENT,_469._2874([this._5134],this._5139)));
                     _1567(new CommandNotification(CommandNotification.MODIFY_BONE_NAME,_469._3493(this._5139,_124._1747(this._5134.name,this._5139.rootArmatureData._1793))));
                  }
                  this._5135();
               }
               else
               {
                  this._5001._5128("createBone",false);
                  this._2909._5126("createBone",true);
                  this._2909._5068();
                  _1567(new StageNotification(StageNotification.SET_CURSOR,_12.CURSOR_APPEND_SLOT));
                  stage.addEventListener(KeyboardEvent.KEY_UP,this._5127);
               }
            }
            else
            {
               this._5135();
            }
         }
         var _loc2_:_52 = _2226._3872;
         if(Boolean(_loc2_) && this._1886._1779.indexOf(_loc2_) == -1)
         {
            _2226._2484 = null;
         }
      }
      
      private function _5125(param1:KeyboardEvent = null) : void
      {
         this._5138(this.autoBindSlot && this._5130 && Boolean(this._5139) && !Shortcut._1677());
      }
      
      private function _5127(param1:KeyboardEvent = null) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         if(!Shortcut._1677())
         {
            stage.removeEventListener(KeyboardEvent.KEY_UP,this._5127);
            this._5001._5128("createBone",true);
            this._2909._5126("createBone",false);
            this._2909._5068();
            _1567(new StageNotification(StageNotification.REMOVE_CURSOR,_12.CURSOR_APPEND_SLOT));
            _loc2_ = _2226._3863;
            if(_loc2_.length > 0)
            {
               _loc3_ = (_loc2_[0] as _79).name;
               _1567(new CommandNotification(CommandNotification.SET_SLOTS_PARENT,_469._2874(_loc2_,this._5139)));
               _1567(new CommandNotification(CommandNotification.MODIFY_BONE_NAME,_469._3493(this._5139,_124._1747(_loc3_,this._5139.rootArmatureData._1793))));
            }
            this._5135();
         }
      }
      
      private function _2838() : void
      {
         this._4359.x = this._5001.mouseX;
         this._4359.y = this._5001.mouseY;
         this.parentBone = _2226._3872;
         if(this._1886._1779.indexOf(this.parentBone) == -1)
         {
            this.parentBone = this._1886._1990;
            _2226._2484 = null;
         }
         if(!this.parentBone && Boolean(this._5137))
         {
            this.parentBone = this._5137._1990;
         }
         this._5132 = this.parentBone._2009.clone();
         this._5132.invert();
         this._5133.copyFrom(this._4359);
         this._5133 = _88._2135(this._5133,this._5132);
      }
      
      private function createBone(param1:int = 0, param2:Number = 0) : void
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         if(this.parentBone)
         {
            _loc3_ = _2226._3863;
            this._5131 = _loc3_.length == 0;
            this._5134 = null;
            _loc4_ = this._5131 ? "bone" : (_loc3_[0] as _79).name;
            this._5139 = _52._1729(_124._1747(_loc4_,this.parentBone.rootArmatureData._1793),this.parentBone);
            this._5139.length = param1;
            this._5139._1724.x = this._5133.x;
            this._5139._1724.y = this._5133.y;
            this._5139._1724.scaleX = 1;
            this._5139._1724.scaleY = 1;
            this._5139._1724.rotation = param2;
            _607.instance._4355();
            _loc5_ = _469._2916(this._5139,this.parentBone,_loc3_);
            _1567(new CommandNotification(CommandNotification.ADD_BONE,_loc5_));
            _11110.instance._11380._11139(_11105.CreateBone_Length,this._5139.length.toFixed());
            _11110.instance._11380._11132();
         }
      }
      
      public function _2888() : void
      {
         this._5139 = null;
      }
      
      private function _5135() : void
      {
         _2217._1651();
         this._5139 = null;
         _2226._2889 = [_2226._3872];
      }
      
      private function _5138(param1:Boolean) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:_665 = null;
         var _loc5_:_759 = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:_79 = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         this._5134 = null;
         if(param1)
         {
            _loc2_ = new Point(0,0);
            _loc3_ = new Point(this._5139.length,0);
            _88._2135(_loc2_,this._5139._2009);
            _88._2135(_loc3_,this._5139._2009);
            _loc4_ = _2214._1844._2871;
            if((_loc5_ = _loc4_._3286.visibleFilter)._5938 && _loc5_._5938[_loc4_._2865.id] && Boolean(_loc5_._5938[_loc4_._2865.id].markedSlotList))
            {
               _loc6_ = _loc5_._5938[_loc4_._2865.id].markedSlotList;
            }
            _loc7_ = [];
            for each(_loc8_ in this._1886._1780)
            {
               if(_loc8_._2049 && _2226._3367(_loc8_) && (_loc6_ == null || _loc6_.indexOf(_loc8_.id) < 0))
               {
                  if(_82._2169(_loc2_,_loc8_) && _82._2169(_loc3_,_loc8_))
                  {
                     _loc7_.push(_loc8_);
                  }
               }
            }
            if(_loc7_.length > 0)
            {
               if(_loc7_.length == 1)
               {
                  this._5134 = _loc7_[0];
               }
               else
               {
                  _loc9_ = 0;
                  _loc10_ = 0;
                  for each(_loc8_ in _loc7_)
                  {
                     _loc10_ = _loc8_._2038 * _loc8_._2037 * _loc8_.globalTransform.scaleX * _loc8_.globalTransform.scaleY;
                     if(!this._5134 || _loc10_ < _loc9_)
                     {
                        this._5134 = _loc8_;
                        _loc9_ = _loc10_;
                     }
                  }
               }
            }
         }
         if(this._5139)
         {
            _2226._2889 = !!this._5134 ? [this._5139,this._5134] : [this._5139];
         }
      }
      
      private function get _2909() : _598
      {
         return _1407.getInstance(_598) as _598;
      }
      
      private function get _5137() : _50
      {
         if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
         {
            return _2214._1844._2871._2865;
         }
         return null;
      }
      
      public function get _10471() : _52
      {
         return this._5139;
      }
      
      public function set stageView(param1:_960) : void
      {
         if(this._5141 == param1)
         {
            return;
         }
         this._5141 = param1;
         this._5001 = this._5141._3198;
         this.start();
      }
      
      protected function get _5136() : _52
      {
         return this._5001._5021;
      }
      
      public function get enabled() : Boolean
      {
         return this._5142;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._5142 != param1)
         {
            this._5142 = param1;
            if(this._5142)
            {
               this._5141.addEventListener(MouseEvent.MOUSE_DOWN,this._5129,false,2);
               this._2909._5126("createBone",false);
            }
            else
            {
               this._5001._5128("createBone",true);
               if(stage)
               {
                  stage.removeEventListener(MouseEvent.MOUSE_UP,this._4126);
                  stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4157);
               }
               this._5141.removeEventListener(MouseEvent.MOUSE_DOWN,this._5129);
            }
         }
      }
   }
}

