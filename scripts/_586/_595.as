package _586
{
   import _1404._1407;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._524;
   import _521._530;
   import _561._566;
   import _658.Mesh;
   import _658._660;
   import _658._661;
   import _658._662;
   import _708._717;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _93._94;
   import _953._956;
   import egret.utils.tr;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class _595 extends _94
   {
      private var _4296:_70;
      
      private var _4213:_79;
      
      private var _2123:Mesh;
      
      private var _5097:_956;
      
      private var _5210:_660;
      
      private var _5173:Array;
      
      private var _5204:Boolean;
      
      private var _5142:Boolean;
      
      private var _5199:_52;
      
      private var _5212:Boolean;
      
      private var _5193:_566;
      
      private var _5207:Array;
      
      private var _5196:Dictionary;
      
      private var _5211:Sprite;
      
      public function _595()
      {
         super();
         this._5173 = [];
         this._5193 = _1407.getInstance(_566) as _566;
      }
      
      override public function start() : void
      {
         if(!this._5142)
         {
            super.start();
            this._5142 = true;
         }
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.UPDATE_SELECTED_BINDING_BONE,this._5205);
         _1565(StageNotification.DELETE_RIG_BONE,this._5202);
         _1565(StageNotification.MODIFY_BONE_WEIGHT,this._5197);
         _1565(StageNotification.MODIFY_BONE_WEIGHT_BAR,this._5194);
         _1565(StageNotification.START_AUTO_WEIGHT,this._5198);
         _1565(StageNotification.END_AUTO_WEIGHT,this._5203);
         _1565(StageNotification.AUTO_WEIGHT,this._4431);
      }
      
      private function _4431(param1:StageNotification) : void
      {
         if(Boolean(this._2123) && this._2123._2119())
         {
            this._5193.autoWeight(this._2123);
         }
      }
      
      private function _5198(param1:StageNotification) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
            "showText":tr("Tip.weight.autoWeight"),
            "type":_717.ANIMATE
         }));
         if(this._5211 == null)
         {
            if(Boolean(this._5097) && Boolean(this._5097.stage))
            {
               _loc2_ = this._5097.stage.stageWidth;
               _loc3_ = this._5097.stage.stageHeight;
               this._5211 = new Sprite();
               this._5211.graphics.beginFill(0,0.5);
               this._5211.graphics.drawRect(0,0,_loc2_,_loc3_);
               this._5211.graphics.endFill();
            }
         }
         if(this._5211 && this._5097 && Boolean(this._5097.stage))
         {
            this._5097.stage.addChild(this._5211);
         }
      }
      
      private function _5203(param1:StageNotification) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_662 = null;
         var _loc6_:_52 = null;
         var _loc7_:Array = null;
         var _loc8_:Object = null;
         var _loc9_:Array = null;
         var _loc10_:Object = null;
         _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
            "showText":tr("Tip.weight.autoWeightEnd"),
            "type":_717.ANIMATE
         }));
         if(Boolean(this._5211) && this._5211.parent != null)
         {
            this._5211.parent.removeChild(this._5211);
         }
         var _loc2_:Dictionary = param1.data;
         if(_loc2_)
         {
            _loc7_ = [];
            for(_loc8_ in _loc2_)
            {
               _loc5_ = _loc8_ as _662;
               if((Boolean(_loc5_)) && Boolean(this._5210))
               {
                  _loc9_ = [];
                  _loc3_ = 0;
                  _loc4_ = int(this._5210._2922.length);
                  while(_loc3_ < _loc4_)
                  {
                     _loc6_ = this._5210._2922[_loc3_];
                     _loc9_.push({
                        "bone":_loc6_,
                        "weight":_loc5_._5208(_loc6_)
                     });
                     _loc3_++;
                  }
                  (_loc10_ = {})._1836 = this._5199;
                  _loc10_.mesh = this._2123;
                  _loc10_.meshRig = this._5210;
                  _loc10_._1837 = this._4213;
                  _loc10_._3205 = _loc8_ as _662;
                  _loc10_._2992 = _loc9_;
                  _loc10_._2991 = _loc2_[_loc8_];
                  _loc7_.push(_loc10_);
               }
            }
            _1567(new CommandNotification(CommandNotification.MODIFY_BONE_WEIGHTS,_loc7_));
            _2217._1651();
         }
      }
      
      public function stop() : void
      {
         this.dispose();
      }
      
      public function _5177(param1:_79, param2:Mesh, param3:_52, param4:_661, param5:int) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:_52 = null;
         var _loc6_:_662 = param2.meshRig._5209(param4);
         var _loc7_:Number = _loc6_._5208(param3);
         var _loc8_:Number = param5 * 0.01;
         if(_loc7_ + _loc8_ > 1)
         {
            _loc8_ = 1 - _loc7_;
         }
         else if(_loc7_ + _loc8_ < 0)
         {
            _loc8_ = -_loc7_;
         }
         if(_loc8_ == 0)
         {
            return;
         }
         var _loc9_:Object;
         (_loc9_ = {})._1836 = param3;
         _loc9_.mesh = param2;
         _loc9_.meshRig = param2.meshRig;
         _loc9_._1837 = param1;
         _loc9_._3205 = _loc6_;
         _loc9_.weight = _loc7_;
         _loc9_.weightOffset = _loc8_;
         if(this._5207 == null)
         {
            if(_loc7_ == 1)
            {
               return;
            }
            this._5207 = [];
            _loc10_ = 0;
            _loc11_ = int(param2.meshRig._2922.length);
            while(_loc10_ < _loc11_)
            {
               _loc12_ = param2.meshRig._2922[_loc10_];
               this._5207.push({
                  "bone":_loc12_,
                  "weight":_loc6_._5208(_loc12_)
               });
               _loc10_++;
            }
         }
         _loc9_._2992 = this._5207;
         _loc9_._2991 = this._5200(this._5207,param3,_loc7_ + _loc8_);
         _1567(new CommandNotification(CommandNotification.MODIFY_BONE_WEIGHT,_loc9_));
      }
      
      public function _5165(param1:_79, param2:Mesh, param3:_52, param4:Vector.<_661>, param5:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:Object = null;
         var _loc8_:Array = [];
         _loc6_ = 0;
         _loc7_ = int(param4.length);
         while(_loc6_ < _loc7_)
         {
            _loc9_ = this._5195(param1,param2,param3,param4[_loc6_],param5);
            if(_loc9_)
            {
               _loc8_.push(_loc9_);
            }
            _loc6_++;
         }
         if(_loc8_.length > 0)
         {
            _1567(new CommandNotification(CommandNotification.MODIFY_BONE_WEIGHTS,_loc8_));
         }
      }
      
      private function _5195(param1:_79, param2:Mesh, param3:_52, param4:_661, param5:int) : Object
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:_52 = null;
         var _loc6_:_662 = param2.meshRig._5209(param4);
         var _loc7_:Number = _loc6_._5208(param3);
         var _loc8_:Number = param5 * 0.01;
         if(_loc7_ + _loc8_ > 1)
         {
            _loc8_ = 1 - _loc7_;
         }
         else if(_loc7_ + _loc8_ < 0)
         {
            _loc8_ = -_loc7_;
         }
         var _loc9_:Object;
         (_loc9_ = {})._1836 = param3;
         _loc9_.mesh = param2;
         _loc9_.meshRig = param2.meshRig;
         _loc9_._1837 = param1;
         _loc9_._3205 = _loc6_;
         _loc9_.weight = _loc7_;
         _loc9_.weightOffset = _loc8_;
         if(this._5196 == null)
         {
            this._5196 = new Dictionary(true);
         }
         var _loc13_:Array = this._5196[param4];
         if(_loc13_ == null)
         {
            if(_loc7_ == 1)
            {
               return null;
            }
            _loc13_ = [];
            this._5196[param4] = _loc13_;
            _loc10_ = 0;
            _loc11_ = int(param2.meshRig._2922.length);
            while(_loc10_ < _loc11_)
            {
               _loc12_ = param2.meshRig._2922[_loc10_];
               _loc13_.push({
                  "bone":_loc12_,
                  "weight":_loc6_._5208(_loc12_)
               });
               _loc10_++;
            }
         }
         _loc9_._2992 = _loc13_;
         _loc9_._2991 = this._5200(_loc13_,param3,_loc7_ + _loc8_);
         return _loc9_;
      }
      
      public function _5166() : void
      {
         if(this._5207 != null)
         {
            this._5207 = null;
            _2217._1651();
         }
         if(this._5196 != null)
         {
            this._5196 = null;
            _2217._1651();
         }
      }
      
      private function _5194(param1:StageNotification) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_52 = null;
         if(this._5097.stage)
         {
            this._5097.stage.addEventListener(MouseEvent.MOUSE_UP,this._5214,true);
         }
         var _loc2_:_52 = param1.data._1836;
         var _loc3_:_662 = param1.data._3205;
         var _loc4_:Number = Number(param1.data.weight);
         var _loc5_:Number = Number(param1.data.offset);
         var _loc6_:Object;
         (_loc6_ = {})._1836 = this._5199;
         _loc6_.mesh = this._2123;
         _loc6_.meshRig = this._5210;
         _loc6_._1837 = this._4213;
         _loc6_._3205 = _loc3_;
         _loc6_.weight = _loc4_;
         _loc6_.weightOffset = _loc5_;
         if(this._5207 == null)
         {
            if(_loc4_ == 1)
            {
               return;
            }
            this._5207 = [];
            _loc7_ = 0;
            _loc8_ = int(this._5210._2922.length);
            while(_loc7_ < _loc8_)
            {
               _loc9_ = this._5210._2922[_loc7_];
               this._5207.push({
                  "bone":_loc9_,
                  "weight":_loc3_._5208(_loc9_)
               });
               _loc7_++;
            }
         }
         _loc6_._2992 = this._5207;
         _loc6_._2991 = this._5200(this._5207,_loc2_,_loc4_ + _loc5_);
         _1567(new CommandNotification(CommandNotification.MODIFY_BONE_WEIGHT,_loc6_));
      }
      
      private function _5200(param1:Array, param2:_52, param3:Number) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc11_:int = 0;
         var _loc13_:int = 0;
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         _loc4_ = 0;
         _loc5_ = int(param1.length);
         while(_loc4_ < _loc5_)
         {
            _loc10_.push({
               "bone":param1[_loc4_].bone,
               "weight":param1[_loc4_].weight
            });
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(_loc10_.length);
         while(_loc4_ < _loc5_)
         {
            if(_loc10_[_loc4_].bone != param2)
            {
               if(_loc10_[_loc4_].weight <= 0)
               {
                  _loc9_.push(_loc10_[_loc4_]);
               }
               else
               {
                  _loc10_[_loc4_].weight = Math.round(_loc10_[_loc4_].weight * 100);
                  _loc7_ += _loc10_[_loc4_].weight;
                  _loc6_.push(_loc10_[_loc4_]);
               }
            }
            else
            {
               _loc8_ = Math.round((param3 - _loc10_[_loc4_].weight) * 100);
            }
            _loc4_++;
         }
         _loc6_.sortOn("weight",Array.NUMERIC | Array.CASEINSENSITIVE);
         var _loc12_:int = _loc8_;
         _loc4_ = 0;
         _loc5_ = int(_loc6_.length);
         while(_loc4_ < _loc5_)
         {
            _loc11_ = Math.ceil(_loc6_[_loc4_].weight / _loc7_ * _loc8_);
            if(Math.abs(_loc11_) > Math.abs(_loc12_))
            {
               _loc11_ = _loc12_;
            }
            if(_loc6_[_loc4_].weight - _loc11_ < 0)
            {
               _loc11_ = int(_loc6_[_loc4_].weight);
            }
            _loc6_[_loc4_].weight -= _loc11_;
            _loc12_ -= _loc11_;
            _loc13_ = _loc4_;
            if(_loc12_ == 0)
            {
               break;
            }
            _loc4_++;
         }
         _loc7_ = 0;
         _loc4_ = 0;
         _loc5_ = int(_loc6_.length);
         while(_loc4_ < _loc5_)
         {
            if(_loc4_ != _loc13_)
            {
               _loc7_ += _loc6_[_loc4_].weight;
            }
            _loc4_++;
         }
         var _loc14_:int = Math.floor(param3 * 100);
         if(_loc6_.length > _loc13_)
         {
            _loc6_[_loc13_].weight = 100 - _loc7_ - _loc14_;
         }
         _loc6_.push({
            "bone":param2,
            "weight":_loc14_
         });
         _loc4_ = 0;
         _loc5_ = int(_loc6_.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_[_loc4_].weight *= 0.01;
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(_loc9_.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_.push(_loc9_[_loc4_]);
            _loc4_++;
         }
         return _loc6_;
      }
      
      private function _5214(param1:MouseEvent) : void
      {
         this._5097.stage.removeEventListener(MouseEvent.MOUSE_UP,this._5214,true);
         this._5207 = null;
         _2217._1651();
      }
      
      private function _5197(param1:StageNotification) : void
      {
         var _loc2_:_52 = param1.data._1836;
         var _loc3_:_662 = param1.data._3205;
         var _loc4_:Number = Number(param1.data.weight);
         var _loc5_:Number = Number(param1.data.offset);
         if(_loc4_ == 1)
         {
            return;
         }
         this._5201(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      private function _5201(param1:_52, param2:_662, param3:Number, param4:Number) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_52 = null;
         if(param1 == null || param2 == null || this._5210 == null)
         {
            return;
         }
         var _loc5_:Object;
         (_loc5_ = {})._1836 = this._5199;
         _loc5_.mesh = this._2123;
         _loc5_.meshRig = this._5210;
         _loc5_._1837 = this._4213;
         _loc5_._3205 = param2;
         _loc5_.weight = param3;
         _loc5_.weightOffset = param4;
         var _loc6_:Array = [];
         _loc7_ = 0;
         _loc8_ = int(this._5210._2922.length);
         while(_loc7_ < _loc8_)
         {
            _loc9_ = this._5210._2922[_loc7_];
            if(_loc9_)
            {
               _loc6_.push({
                  "bone":_loc9_,
                  "weight":param2._5208(_loc9_)
               });
            }
            _loc7_++;
         }
         _loc5_._2992 = _loc6_;
         _loc5_._2991 = this._5200(_loc6_,param1,param3 + param4);
         _1567(new CommandNotification(CommandNotification.MODIFY_BONE_WEIGHT,_loc5_));
         _2217._1651();
      }
      
      public function _5160(param1:_52, param2:_661, param3:Number) : void
      {
         var _loc4_:_662 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(Boolean(this._2123) && Boolean(this._2123.meshRig))
         {
            _loc4_ = this._2123.meshRig._5209(param2);
            if(_loc4_ == null)
            {
               return;
            }
            _loc5_ = _loc4_._5208(param1);
            if(_loc5_ < 1)
            {
               _loc6_ = param3 - _loc5_;
               this._5201(param1,_loc4_,_loc5_,_loc6_);
            }
         }
      }
      
      private function _5202(param1:StageNotification) : void
      {
         var _loc3_:Object = null;
         var _loc2_:_52 = param1.data;
         if(_loc2_ != null)
         {
            _loc3_ = {};
            _loc3_._1836 = _loc2_;
            _loc3_.mesh = this._2123;
            _loc3_.meshRig = this._5210;
            _loc3_._1837 = this._4213;
            _1567(new CommandNotification(CommandNotification.MESH_DELETE_BONE,_loc3_));
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_BINDING_BONE,null));
         }
      }
      
      private function _5205(param1:StageNotification) : void
      {
         this._5199 = param1.data as _52;
      }
      
      private function _4439(param1:StageNotification) : void
      {
         this.endPick();
         _1567(new StageNotification(StageNotification.STOP_EDIT_RIG));
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(StageNotification.UPDATE_SELECTED_BINDING_BONE,this._5205);
         _1564(StageNotification.DELETE_RIG_BONE,this._5202);
         _1564(StageNotification.MODIFY_BONE_WEIGHT,this._5197);
         _1564(StageNotification.START_AUTO_WEIGHT,this._5198);
         _1564(StageNotification.END_AUTO_WEIGHT,this._5203);
         _1564(StageNotification.MODIFY_BONE_WEIGHT_BAR,this._5194);
         _1564(StageNotification.AUTO_WEIGHT,this._4431);
         _1564(StageNotification.STOP_PICK,this._4439);
         this._5097.removeEventListener(MouseEvent.CLICK,this._5206);
         this._5142 = false;
      }
      
      public function set _1838(param1:_70) : void
      {
         if(this._4296 != param1)
         {
            this._4296 = param1;
            if(this._4296 != null)
            {
               this._2123 = this._4296.mesh;
               this._5210 = this._2123.meshRig;
               this._4213 = this._4296._1760;
            }
            else
            {
               if(this._5212)
               {
                  _530.instance._3834();
               }
               this._2123 = null;
               this._4213 = null;
               this._5210 = null;
            }
         }
      }
      
      public function set _5098(param1:_956) : void
      {
         this._5097 = param1;
      }
      
      private function endPick() : void
      {
         this._5212 = false;
         if(this._5204)
         {
            this._5193.autoWeight(this._2123);
            this._5204 = false;
         }
         _1564(StageNotification.STOP_PICK,this._4439);
         this._5097.removeEventListener(MouseEvent.CLICK,this._5206);
      }
      
      public function _3833() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._2123 == null)
         {
            return;
         }
         _1565(StageNotification.STOP_PICK,this._4439);
         this._5097.addEventListener(MouseEvent.CLICK,this._5206);
         this._5212 = true;
         this._5173.length = 0;
         this._5204 = false;
         this._5210 = this._2123.meshRig;
         if(this._5210)
         {
            _loc1_ = 0;
            _loc2_ = int(this._5210._2922.length);
            while(_loc1_ < _loc2_)
            {
               this._5173.push(this._5210._2922[_loc1_]);
               _loc1_++;
            }
         }
         _530.instance._3833(this._2123,this.pickBone,this._5173,true);
      }
      
      private function _5206(param1:MouseEvent) : void
      {
         _524._3785("click","pick");
      }
      
      private function pickBone(param1:Mesh, param2:_52) : void
      {
         var _loc3_:Object = null;
         if(Boolean(param2) && this._5212)
         {
            if(this._4213 == null)
            {
               return;
            }
            if(this._5210 == null)
            {
               this._5210 = new _660(this._2123,this._4213._2009);
            }
            if(this._5210._2922.length == 0)
            {
               this._5204 = true;
            }
            if(!this._5210._3873(param2))
            {
               _loc3_ = {};
               _loc3_._1836 = param2;
               _loc3_.mesh = this._2123;
               _loc3_.meshRig = this._5210;
               _loc3_._1837 = this._4213;
               _1567(new CommandNotification(CommandNotification.MESH_ADD_BONE,_loc3_));
            }
         }
      }
   }
}

