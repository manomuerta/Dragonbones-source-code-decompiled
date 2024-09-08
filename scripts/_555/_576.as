package _555
{
   import _1008.TransformPanel;
   import _1177.UIEvent;
   import _127._162;
   import _13505._13510;
   import _1374.TextInput;
   import _1404._1407;
   import _24.Shortcut;
   import _24._26;
   import _273._10431;
   import _470._469;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._523;
   import _586._591;
   import _586._599;
   import _636.AnimationEvent;
   import _636.DBPanelEvent;
   import _636.TransformEvent;
   import _644._646;
   import _708._714;
   import _708._715;
   import _708._716;
   import _708._718;
   import _708._719;
   import _783.ComicNotification;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _81._83;
   import _81._88;
   import _81._91;
   import _93._92;
   import _93._94;
   import _953._10624;
   import flash.events.Event;
   
   public class _576 extends _94
   {
      private var _4799:TransformPanel;
      
      private var _4896:_10624;
      
      private var _2889:Array;
      
      private var _4782:Array;
      
      private var model:Object;
      
      private var _4797:Boolean;
      
      private var _4018:Boolean;
      
      private var _1890:Boolean = false;
      
      private var _5034:_523;
      
      private var _10532:_162;
      
      private var _10760:int;
      
      private var _13876:Boolean;
      
      private var _4798:Boolean = true;
      
      private var _10472:Boolean = false;
      
      public function _576()
      {
         super();
         this._5034 = _1407.getInstance(_523) as _523;
      }
      
      override protected function init() : void
      {
         super.init();
         this._4799 = _1407.getInstance(TransformPanel);
      }
      
      override protected function _1576() : void
      {
         if(this._4799._4790)
         {
            this._3990();
            this._4767(null);
         }
         else
         {
            this._4799.addEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         }
         _1565(StageNotification.UPDATE_EDIT_MODE,this._4023,-100);
         _1565(StageNotification.UPDATE_COORDINATE_TYPE,this._4767);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1565(ComicNotification.UPDATE_SELCTEDS,this._10470);
         _1565(StageNotification.UPDATE_ANIMATION_MODE,this._3976);
         _1565(StageNotification.CHANGE_TRANSFORM_MODEL,this._10753);
         _1565(StageNotification.CHANGE_LOCK_WIDTH_HEIGHT,this._13873);
         _1565(StageNotification.UPDATE_CURRENT_TOOL,this._10762);
         _1565(TimelineNotification.UPDATE_KEY_STATUS,this._13800);
         this._4799.addEventListener(DBPanelEvent.COORDINATE_CHANGED,this._4764);
      }
      
      private function _13800(param1:TimelineNotification) : void
      {
         var _loc2_:int = param1.data;
         if(this._4896)
         {
            this._4896._13875(_loc2_);
         }
      }
      
      private function _10762(param1:StageNotification) : void
      {
         var _loc2_:_716 = param1.data as _716;
         if(_loc2_ != _716.SELECT)
         {
            _1567(new StageNotification(StageNotification.CHANGE_TRANSFORM_MODEL,_599.TRANSFORM_FREE));
         }
      }
      
      private function _10753(param1:StageNotification) : void
      {
         this._10760 = int(param1.data);
         if(this._4896)
         {
            this._4896._10761 = this._10760;
         }
      }
      
      private function _13873(param1:StageNotification) : void
      {
         this._13876 = Boolean(param1.data);
         if(this._4896)
         {
            this._4896._13877 = this._13876;
         }
      }
      
      private function _3976(param1:StageNotification) : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            this._4018 = true;
            this._4799.enabled = !this._4018;
         }
         else
         {
            this._4018 = false;
            this._4799.enabled = !this._4018;
         }
         if(this._4896)
         {
            this._4896.enabled = !this._4018;
         }
      }
      
      private function _10470(param1:ComicNotification) : void
      {
         this.refresh();
      }
      
      private function _4023(param1:StageNotification) : void
      {
         if(this._4896)
         {
            this._4896._13882 = this._2873 == _715.GENERAL;
            this._4896._13879 = this._2873 == _715.ARMATURE;
         }
         this.refresh();
      }
      
      private function _4767(param1:StageNotification) : void
      {
         this._4799._4768 = _2214._3326;
      }
      
      private function _4764(param1:DBPanelEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.CHANGE_COORDINATE,this._4799._4768));
      }
      
      private function _3991(param1:UIEvent) : void
      {
         this._1890 = true;
         this._4799.removeEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         this._3990();
         this._4767(null);
         this.refresh();
      }
      
      private function _3990() : void
      {
         this._4799.addEventListener(TransformEvent.ROTATION_CHANGE,this._10759);
         this._4799.addEventListener(TransformEvent.X_CHANGE,this._10759);
         this._4799.addEventListener(TransformEvent.Y_CHANGE,this._10759);
         this._4799.addEventListener(TransformEvent.SCALE_X_CHANGE,this._10759);
         this._4799.addEventListener(TransformEvent.SCALE_Y_CHANGE,this._10759);
         this._4799.addEventListener(TransformEvent.WIDTH_CHANGE,this._10759);
         this._4799.addEventListener(TransformEvent.HEIGHT_CHANGE,this._10759);
         this._4799.addEventListener(TransformEvent.ROTATION_COMPLETE,this._4766);
         this._4799.addEventListener(AnimationEvent.MODIFY_SLOT_COMIC_ALPHA,this._4391);
         this._4799.addEventListener(AnimationEvent.CHANGE_SLOT_COMIC_ALPHA,this._4392);
      }
      
      private function _10756() : void
      {
         this._4896.addEventListener(TransformEvent.ROTATION_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.X_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.Y_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.SCALE_X_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.SCALE_Y_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.WIDTH_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.HEIGHT_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.ROTATION_COMPLETE,this._4766);
         this._4896.addEventListener(TransformEvent.TRANSFORM_MODEL_CHANGE,this._10755);
         this._4896.addEventListener(TransformEvent.LOCK_WIDTH_HEIGHT_CHANGE,this._13874);
         this._4896.addEventListener(TransformEvent.KEY_TRANSLATE,this._13878);
         this._4896.addEventListener(TransformEvent.KEY_ROTATE,this._13880);
         this._4896.addEventListener(TransformEvent.KEY_SCALE,this._13881);
         Shortcut._1681(stage,_26.FREE_TRANSFORM,this._10758);
         Shortcut._1681(stage,_26.TRANSLATE_TRANSFORM,this._10751);
         Shortcut._1681(stage,_26.ROTATE_TRANSFORM,this._10754);
         Shortcut._1681(stage,_26.SCALE_TRANSFORM,this._10757);
      }
      
      private function _13878(param1:TransformEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.ADD_BONE_KEY,_13510.FLAG_TRANSLATE));
      }
      
      private function _13880(param1:TransformEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.ADD_BONE_KEY,_13510.FLAG_ROTATE));
      }
      
      private function _13881(param1:TransformEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.ADD_BONE_KEY,_13510.FLAG_SCALE));
      }
      
      private function _10758() : void
      {
         _1567(new StageNotification(StageNotification.CHANGE_TRANSFORM_MODEL,_599.TRANSFORM_FREE));
      }
      
      private function _10751() : void
      {
         _1567(new StageNotification(StageNotification.CHANGE_TRANSFORM_MODEL,_599.TRANSFORM_TRANSLATE));
      }
      
      private function _10754() : void
      {
         _1567(new StageNotification(StageNotification.CHANGE_TRANSFORM_MODEL,_599.TRANSFORM_ROTATE));
      }
      
      private function _10757() : void
      {
         _1567(new StageNotification(StageNotification.CHANGE_TRANSFORM_MODEL,_599.TRANSFORM_SCALE));
      }
      
      private function _10752() : void
      {
         this._4896.removeEventListener(TransformEvent.ROTATION_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.X_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.Y_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.SCALE_X_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.SCALE_Y_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.WIDTH_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.HEIGHT_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.ROTATION_COMPLETE,this._4766);
         this._4896.removeEventListener(TransformEvent.TRANSFORM_MODEL_CHANGE,this._10755);
         this._4896.removeEventListener(TransformEvent.LOCK_WIDTH_HEIGHT_CHANGE,this._13874);
         Shortcut._1673(stage,_26.FREE_TRANSFORM,this._10758);
         Shortcut._1673(stage,_26.TRANSLATE_TRANSFORM,this._10751);
         Shortcut._1673(stage,_26.ROTATE_TRANSFORM,this._10754);
         Shortcut._1673(stage,_26.SCALE_TRANSFORM,this._10757);
      }
      
      private function _10755(param1:TransformEvent) : void
      {
         this._10760 = param1.data;
         _1567(new StageNotification(StageNotification.CHANGE_TRANSFORM_MODEL,param1.data));
      }
      
      private function _13874(param1:TransformEvent) : void
      {
         this._13876 = param1.data;
         _1567(new StageNotification(StageNotification.CHANGE_LOCK_WIDTH_HEIGHT,param1.data));
      }
      
      private function _4391(param1:AnimationEvent) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:Vector.<_91> = null;
         var _loc4_:_83 = null;
         var _loc5_:_83 = null;
         if(this._2889.length == 0)
         {
            return;
         }
         if(this._2873 == _715.COMIC)
         {
            _loc3_ = this._5034._2889;
            if(Boolean(_loc3_) && _loc3_.length > 0)
            {
               if(_loc3_[0] is _646)
               {
                  _loc2_ = _646(_loc3_[0])._1837;
               }
               else if(_loc3_[0] is _79)
               {
                  _loc2_ = _loc3_[0] as _79;
               }
            }
         }
         if(_loc2_)
         {
            (_loc4_ = _loc2_._1926.clone()).alphaMultiplier = param1.data.to;
            (_loc5_ = _loc4_.clone()).alphaMultiplier = param1.data.from;
            _1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_ALPHA,_469._3484(_loc2_,_loc4_,_loc5_)));
         }
      }
      
      private function _4392(param1:AnimationEvent) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:Vector.<_91> = null;
         var _loc4_:_83 = null;
         var _loc5_:_83 = null;
         var _loc6_:_92 = null;
         if(this._2889.length == 0)
         {
            return;
         }
         if(this._2873 == _715.COMIC)
         {
            _loc3_ = this._5034._2889;
            if(Boolean(_loc3_) && _loc3_.length > 0)
            {
               if(_loc3_[0] is _646)
               {
                  _loc2_ = _646(_loc3_[0])._1837;
               }
               else if(_loc3_[0] is _79)
               {
                  _loc2_ = _loc3_[0] as _79;
               }
            }
         }
         if(_loc2_)
         {
            (_loc4_ = _loc2_._1926.clone()).alphaMultiplier = param1.data.to;
            (_loc5_ = _loc4_.clone()).alphaMultiplier = param1.data.from;
            _loc6_ = new _10431();
            _loc6_._1572(_469._3484(_loc2_,_loc4_,_loc5_));
            _loc6_.execute();
         }
      }
      
      private function _4064(param1:Event) : void
      {
         var _loc2_:Vector.<_91> = null;
         var _loc3_:_79 = null;
         var _loc4_:_83 = null;
         var _loc5_:_83 = null;
         var _loc6_:Object = null;
         if(this._2889.length == 0)
         {
            return;
         }
         if(this._2873 == _715.COMIC)
         {
            _loc2_ = this._5034._2889;
            if(Boolean(_loc2_) && _loc2_.length > 0)
            {
               if(_loc2_[0] is _646)
               {
                  _loc3_ = _646(_loc2_[0])._1837;
               }
               else if(_loc2_[0] is _79)
               {
                  _loc3_ = _loc2_[0] as _79;
               }
               if(_loc3_)
               {
                  _loc4_ = _loc3_._1926.clone();
                  _loc5_ = _loc4_.clone();
                  _loc6_ = _469._3484(_loc3_,_loc4_,_loc5_);
                  _1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_ALPHA,_loc6_));
               }
            }
         }
      }
      
      private function _4766(param1:Event) : void
      {
         _2217._1651();
      }
      
      private function _4787(param1:TextInput) : Number
      {
         var _loc2_:Number = Number(param1.text);
         if(isNaN(_loc2_))
         {
            _loc2_ = 0;
         }
         return _loc2_;
      }
      
      private function get _4763() : String
      {
         if(this._2889.length == 0)
         {
            return "";
         }
         if(this._2889[0] is _52)
         {
            if(this._2873 == _715.ARMATURE)
            {
               return CommandNotification.MODIFY_BONE_TRANSFORM;
            }
            if(this._2873 == _715.ANIMATE)
            {
               return CommandNotification.MODIFY_BONE_FRAME_TRANSFORM;
            }
            if(this._2873 == _715.GENERAL)
            {
               return CommandNotification.MODIFY_BASIC_BONE_FRAME_TRANSFORM;
            }
         }
         else if(this._2889[0] is _79 && this._2889[0] is _70)
         {
            if(this._2873 == _715.ARMATURE)
            {
               return CommandNotification.MODIFY_SLOT_TRANSFORM;
            }
            if(this._2873 == _715.GENERAL)
            {
               return CommandNotification.MODIFY_BASIC_BONE_FRAME_TRANSFORM;
            }
         }
         return "";
      }
      
      private function _4793(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Number = param1;
         return _loc3_ == param2;
      }
      
      private function onSelect(param1:CommandNotification) : void
      {
         this.refresh();
      }
      
      public function refresh(param1:Object = null) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Vector.<_91> = null;
         var _loc8_:_79 = null;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Object = null;
         var _loc13_:_70 = null;
         var _loc14_:_52 = null;
         if(this._1890)
         {
            this._4799._6158.visible = false;
         }
         if(this._2873 == _715.COMIC)
         {
            if(this._1890)
            {
               this._4799._6158.visible = true;
               this._4799._4796.visible = true;
            }
            this._2889 = [];
            _loc7_ = this._5034._2889;
            if((Boolean(_loc7_)) && _loc7_.length > 0)
            {
               if(_loc7_[0] is _646)
               {
                  this._10472 = false;
                  this._2889.push(_646(_loc7_[0])._1837);
                  _loc8_ = _646(_loc7_[0])._1837;
               }
               else if(_loc7_[0] is _79)
               {
                  this._10472 = true;
                  this._2889.push(_loc7_[0]);
                  _loc8_ = _loc7_[0] as _79;
               }
               if(_loc8_)
               {
                  if(this._1890)
                  {
                     this._4799._10474.txt.text = int(_loc8_._1926.alphaMultiplier * 100).toString();
                     this._4799._10473.value = int(_loc8_._1926.alphaMultiplier * 100);
                  }
               }
            }
         }
         else
         {
            this._2889 = _2226._2889;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         for each(_loc6_ in this._2889)
         {
            if(_loc6_ is _79 || _loc6_ is _70)
            {
               if(!this._2876._10471)
               {
                  if(_loc6_ is _79 && !_79(_loc6_)._2049)
                  {
                     _loc5_ = 2;
                  }
                  _loc3_ = 1;
               }
            }
            if(_loc6_ is _52)
            {
               _loc4_ = 1;
            }
         }
         _loc2_ = _loc3_ + _loc4_ + _loc5_;
         if(_loc4_ == 1 && this._2873 == _715.ANIMATE)
         {
            this.enable = true;
         }
         else if(_loc2_ != 1 && this._2873 != _715.COMIC)
         {
            this.enable = false;
            if(this._1890)
            {
               this._4799._4796.visible = false;
            }
            return;
         }
         this.model = new Object();
         if(this._2873 == _715.ARMATURE || this._2873 == _715.ANIMATE)
         {
            if(this._2873 == _715.ANIMATE && _loc4_ == 1)
            {
               _loc9_ = [];
               _loc10_ = 0;
               _loc11_ = int(this._2889.length);
               while(_loc10_ < _loc11_)
               {
                  if(this._2889[_loc10_] is _52)
                  {
                     _loc9_.push(this._2889[_loc10_]);
                  }
                  _loc10_++;
               }
               this.model = this._4770(_loc9_);
               if(_loc2_ != 1)
               {
                  this.model.noTxt = true;
               }
               this.enable = true;
               if(this._1890)
               {
                  this._4799._4796.visible = false;
                  this._4799.model = this.model;
               }
               if(this._4896)
               {
                  this._4896.model = this.model;
               }
               this._4774 = _loc2_ == 1;
            }
            else if(this._2889[0] is _52)
            {
               this.model = this._4770(this._2889);
               this.enable = true;
               if(this._1890)
               {
                  this._4799._4796.visible = false;
                  this._4799.model = this.model;
               }
               if(this._4896)
               {
                  this._4896.model = this.model;
               }
               this._4774 = true;
            }
            else if(this._2889[0] is _79 || this._2889[0] is _70)
            {
               this.model = this._4765(this._2889);
               this.enable = true;
               if(this._1890)
               {
                  this._4799._4796.visible = true;
                  this._4799.model = this.model;
               }
               if(this._4896)
               {
                  this._4896.model = this.model;
               }
               if(this._1890)
               {
                  if(this.model.width == "")
                  {
                     this._4799._4794.txt.text = "";
                  }
                  else
                  {
                     this._4799._4795(this.model.width);
                  }
                  if(this.model.height == "")
                  {
                     this._4799._4789.txt.text = "";
                  }
                  else
                  {
                     this._4799._4788(this.model.height);
                  }
               }
               if(this._2873 == _715.ANIMATE)
               {
                  this._4774 = false;
               }
               else
               {
                  this._4774 = true;
               }
            }
         }
         else if(this._2873 == _715.GENERAL || this._2873 == _715.COMIC)
         {
            this._4782 = [];
            for each(_loc12_ in this._2889)
            {
               if(_loc12_ is _79)
               {
                  _loc12_ = (_loc12_ as _79).parentBoneData;
               }
               else if(_loc12_ is _70)
               {
                  _loc12_ = (_loc12_ as _70)._1760.parentBoneData;
               }
               if(_loc12_)
               {
                  this._4782.push(_loc12_);
               }
            }
            if(this._4782.length <= 0)
            {
               this.enable = false;
               return;
            }
            this.model = this._4770(this._4782);
            this.enable = true;
            if(this._1890)
            {
               this._4799._4796.visible = true;
               this._4799.model = this.model;
            }
            if(this._4896)
            {
               this._4896.model = this.model;
            }
            if(this._2873 == _715.COMIC)
            {
               this._4774 = this._10472;
            }
            else
            {
               this._4774 = true;
            }
            if(this._4782.length > 0)
            {
               _loc13_ = !!this._4782[0]._1882 ? this._4782[0]._1882._2049 : null;
               if(_loc13_)
               {
                  this.model.width = (_loc13_.width * _52(this._4782[0]).currentLocalTransform.scaleX).toFixed(2);
                  this.model.height = (_loc13_.height * _52(this._4782[0]).currentLocalTransform.scaleY).toFixed(2);
               }
               else
               {
                  this.model.width = 0;
                  this.model.height = 0;
               }
            }
            for each(_loc14_ in this._4782)
            {
               if(_loc14_._1882 && _loc14_._1882._2049 && (_loc14_._1882._2049.width * _loc14_.currentLocalTransform.scaleX).toFixed(2) != this.model.width)
               {
                  this.model.width = "";
               }
               if(_loc14_._1882 && _loc14_._1882._2049 && (_loc14_._1882._2049.height * _loc14_.currentLocalTransform.scaleY).toFixed(2) != this.model.height)
               {
                  this.model.height = "";
               }
            }
            if(this._1890)
            {
               if(this.model.width == "")
               {
                  this._4799._4794.txt.text = "";
               }
               else
               {
                  this._4799._4795(this.model.width);
               }
               if(this.model.height == "")
               {
                  this._4799._4789.txt.text = "";
               }
               else
               {
                  this._4799._4788(this.model.height);
               }
            }
         }
      }
      
      private function get _2873() : _715
      {
         return _2220._2873;
      }
      
      public function get enable() : Boolean
      {
         return this._4797;
      }
      
      public function set enable(param1:Boolean) : void
      {
         if(this._4797 != param1)
         {
            this._4797 = param1;
            if(this._1890)
            {
               this._4799.enabled = this._4797;
            }
            if(this._4896)
            {
               this._4896._4774 = this._4797;
            }
            if(!this._4797)
            {
               if(this._1890)
               {
                  this._4799.model = null;
               }
               if(this._4896)
               {
                  this._4896.model = null;
               }
            }
         }
      }
      
      public function set _4774(param1:Boolean) : void
      {
         if(this._1890)
         {
            this._4799._4774 = param1;
         }
         if(this._4896)
         {
            this._4896._4774 = param1;
         }
      }
      
      private function _4770(param1:Array) : Object
      {
         var _loc4_:_52 = null;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Object = null;
         var _loc11_:_52 = null;
         var _loc2_:Object = new Object();
         var _loc3_:Vector.<_52> = new Vector.<_52>();
         if(param1[0] is _52)
         {
            _loc2_.x = _52(param1[0]).currentLocalTransform.x.toFixed(2);
            _loc2_.y = _52(param1[0]).currentLocalTransform.y.toFixed(2);
            _loc2_.rotation = (_52(param1[0]).currentLocalTransform.rotation * _88.RADIAN_TO_ANGLE).toFixed(2);
            _loc2_.scaleX = _52(param1[0]).currentLocalTransform.scaleX.toFixed(2);
            _loc2_.scaleY = _52(param1[0]).currentLocalTransform.scaleY.toFixed(2);
         }
         for each(_loc10_ in param1)
         {
            if(_loc10_ is _52)
            {
               _loc11_ = _loc10_ as _52;
               _loc3_.push(_loc11_);
               if(_loc11_.currentLocalTransform.x.toFixed(2) != _loc2_.x && !_loc5_)
               {
                  _loc2_.x = "";
               }
               if(_loc11_.currentLocalTransform.y.toFixed(2) != _loc2_.y && !_loc6_)
               {
                  _loc2_.y = "";
               }
               if((_loc11_.currentLocalTransform.rotation * _88.RADIAN_TO_ANGLE).toFixed(2) != _loc2_.rotation && !_loc7_)
               {
                  _loc2_.rotation = "";
               }
               if(_loc11_.currentLocalTransform.scaleX.toFixed(2) != _loc2_.scaleX && !_loc8_)
               {
                  _loc2_.scaleX = "";
               }
               if(_loc11_.currentLocalTransform.scaleY.toFixed(2) != _loc2_.scaleY && !_loc9_)
               {
                  _loc2_.scaleY = "";
               }
            }
         }
         _loc2_.bones = _loc3_;
         return _loc2_;
      }
      
      private function _4765(param1:Array) : Object
      {
         var _loc3_:_79 = null;
         var _loc4_:Object = null;
         var _loc2_:Object = new Object();
         if(param1[0] is _79)
         {
            _loc3_ = _79(param1[0]);
         }
         else if(param1[0] is _70)
         {
            _loc3_ = _70(param1[0])._1760;
         }
         if(Boolean(_loc3_) && Boolean(_loc3_._2049))
         {
            _loc2_.width = (_loc3_._2049.width * _loc3_.currentLocalTransform.scaleX).toFixed(2);
            _loc2_.height = (_loc3_._2049.height * _loc3_.currentLocalTransform.scaleY).toFixed(2);
         }
         else
         {
            _loc2_.width = 0;
            _loc2_.height = 0;
         }
         if(Boolean(_loc3_) && Boolean(_loc3_._2049))
         {
            _loc2_.x = _loc3_.currentLocalTransform.x.toFixed(2);
            _loc2_.y = _loc3_.currentLocalTransform.y.toFixed(2);
            _loc2_.rotation = (_loc3_.currentLocalTransform.rotation * _88.RADIAN_TO_ANGLE).toFixed(2);
            _loc2_.scaleX = _loc3_.currentLocalTransform.scaleX.toFixed(2);
            _loc2_.scaleY = _loc3_.currentLocalTransform.scaleY.toFixed(2);
         }
         for each(_loc4_ in param1)
         {
            if(_loc4_ is _79)
            {
               _loc3_ = _79(_loc4_);
            }
            else if(_loc4_ is _70)
            {
               _loc3_ = _70(_loc4_)._1760;
            }
            if(_loc3_ && _loc3_._2049 && _loc3_.currentLocalTransform.x.toFixed(2) != _loc2_.x)
            {
               _loc2_.x = "";
            }
            if(_loc3_ && _loc3_._2049 && _loc3_.currentLocalTransform.y.toFixed(2) != _loc2_.y)
            {
               _loc2_.y = "";
            }
            if(_loc3_ && _loc3_._2049 && (_loc3_.currentLocalTransform.rotation * _88.RADIAN_TO_ANGLE).toFixed(2) != _loc2_.rotation)
            {
               _loc2_.rotation = "";
            }
            if(_loc3_ && _loc3_._2049 && _loc3_.currentLocalTransform.scaleX.toFixed(2) != _loc2_.scaleX)
            {
               _loc2_.scaleX = "";
            }
            if(_loc3_ && _loc3_._2049 && _loc3_.currentLocalTransform.scaleY.toFixed(2) != _loc2_.scaleY)
            {
               _loc2_.scaleY = "";
            }
            if(_loc3_ && _loc3_._2049 && (_loc3_._2049.width * _loc3_.currentLocalTransform.scaleX).toFixed(2) != _loc2_.width)
            {
               _loc2_.width = "";
            }
            if(_loc3_ && _loc3_._2049 && (_loc3_._2049.height * _loc3_.currentLocalTransform.scaleY).toFixed(2) != _loc2_.height)
            {
               _loc2_.height = "";
            }
         }
         return _loc2_;
      }
      
      private function get _2876() : _591
      {
         return _1407.getInstance(_591) as _591;
      }
      
      public function set stagePanel(param1:_10624) : void
      {
         if(this._4896 != param1)
         {
            if(this._4896)
            {
               this._10752();
            }
            this._4896 = param1;
            if(this._4896 != null)
            {
               this._10756();
               this._4896._10761 = this._10760;
               this._4896._13882 = this._2873 == _715.GENERAL;
            }
         }
      }
      
      public function get _10761() : int
      {
         return this._10760;
      }
      
      private function _10746(param1:_718, param2:Number, param3:Boolean = true, param4:Object = null) : void
      {
         var _loc9_:Object = null;
         var _loc11_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Array = null;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         var _loc17_:Number = NaN;
         if(this.model == null)
         {
            return;
         }
         var _loc5_:Number = Number(this.model.width);
         var _loc6_:Number = Number(this.model.height);
         if(this._2889.length == 0)
         {
            return;
         }
         var _loc7_:Array = [];
         var _loc8_:int = 0;
         if(this._2889[0] is _79 || this._2889[0] is _70)
         {
            _loc8_ = 0;
            if(this._2873 == _715.ANIMATE)
            {
               return;
            }
            if(this._2873 == _715.GENERAL)
            {
               this._2889 = this._4782;
               _loc8_ = int(this._2889.length);
            }
            else if(this._2873 == _715.COMIC)
            {
               _loc8_ = 0;
            }
         }
         else
         {
            _loc8_ = int(this._2889.length);
         }
         var _loc10_:Array = [];
         switch(param1)
         {
            case _718.ROTATION:
               if(this.model.rotation == "" || !this._4793(this.model.rotation,param2 * _88.RADIAN_TO_ANGLE))
               {
                  _loc10_ = [];
                  _loc11_ = 0;
                  while(_loc11_ < this._2889.length)
                  {
                     _loc10_[_loc11_] = param2;
                     _loc11_++;
                  }
                  if(this._2873 == _715.COMIC)
                  {
                     _loc9_ = _469._2980(this._2889[0],_719.LOCAL,[_718.ROTATION,_loc10_]);
                     this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc9_));
                  }
                  else
                  {
                     _loc9_ = _469._3476(this._2889,_loc8_,this._2873,_719.LOCAL,[_718.ROTATION,_loc10_],1);
                     if(param3)
                     {
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                     else
                     {
                        _2217._1651();
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                  }
               }
               break;
            case _718.X:
               if(this.model.x == "" || !this._4793(this.model.x,param2))
               {
                  _loc10_ = [];
                  _loc11_ = 0;
                  while(_loc11_ < this._2889.length)
                  {
                     _loc10_[_loc11_] = param2;
                     _loc11_++;
                  }
                  if(this._2873 == _715.COMIC)
                  {
                     _loc9_ = _469._2980(this._2889[0],_719.LOCAL,[_718.X,_loc10_]);
                     this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc9_));
                  }
                  else
                  {
                     _loc9_ = _469._3476(this._2889,_loc8_,this._2873,_719.LOCAL,[_718.X,_loc10_],1);
                     if(param3)
                     {
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                     else
                     {
                        _2217._1651();
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                  }
               }
               break;
            case _718.Y:
               if(this.model.y == "" || !this._4793(this.model.y,param2))
               {
                  _loc10_ = [];
                  _loc11_ = 0;
                  while(_loc11_ < this._2889.length)
                  {
                     _loc10_[_loc11_] = param2;
                     _loc11_++;
                  }
                  if(this._2873 == _715.COMIC)
                  {
                     _loc9_ = _469._2980(this._2889[0],_719.LOCAL,[_718.Y,_loc10_]);
                     this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc9_));
                  }
                  else
                  {
                     _loc9_ = _469._3476(this._2889,_loc8_,this._2873,_719.LOCAL,[_718.Y,_loc10_],1);
                     if(param3)
                     {
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                     else
                     {
                        _2217._1651();
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                  }
               }
               break;
            case _718.SCALE_X:
               if(this._4798)
               {
                  if(this.model.scaleX == "" || !this._4793(this.model.scaleX,param2))
                  {
                     _loc10_ = [];
                     _loc11_ = 0;
                     while(_loc11_ < this._2889.length)
                     {
                        _loc10_[_loc11_] = param2;
                        _loc11_++;
                     }
                     if(this._2873 == _715.COMIC)
                     {
                        _loc9_ = _469._2980(this._2889[0],_719.LOCAL,[_718.SCALE_X,_loc10_]);
                        this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc9_));
                     }
                     else
                     {
                        _loc9_ = _469._3476(this._2889,_loc8_,this._2873,_719.LOCAL,[_718.SCALE_X,_loc10_],1);
                        if(param3)
                        {
                           this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                        }
                        else
                        {
                           _2217._1651();
                           this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                        }
                     }
                  }
               }
               else if(this.model.scaleX == "" || !this._4793(this.model.scaleX,param2 / _loc5_))
               {
                  _loc10_ = [];
                  _loc11_ = 0;
                  while(_loc11_ < this._2889.length)
                  {
                     if(this._2889[_loc11_] is _79)
                     {
                        _loc5_ = _79(this._2889[_loc11_])._2038;
                     }
                     else if(this._2889[_loc11_] is _70)
                     {
                        _loc5_ = _70(this._2889[_loc11_])._1760._2038;
                     }
                     else if(this._2889[_loc11_] is _52)
                     {
                        _loc5_ = _52(this._2889[_loc11_])._1882._2038;
                     }
                     _loc10_[_loc11_] = param2 / _loc5_;
                     _loc11_++;
                  }
                  if(this._2873 == _715.COMIC)
                  {
                     _loc9_ = _469._2980(this._2889[0],_719.LOCAL,[_718.SCALE_X,_loc10_]);
                     this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc9_));
                  }
                  else
                  {
                     _loc9_ = _469._3476(this._2889,_loc8_,this._2873,_719.LOCAL,[_718.SCALE_X,_loc10_],1);
                     if(param3)
                     {
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                     else
                     {
                        _2217._1651();
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                  }
               }
               break;
            case _718.SCALE_Y:
               if(this._4798)
               {
                  if(this.model.scaleY == "" || !this._4793(this.model.scaleY,param2))
                  {
                     _loc10_ = [];
                     _loc11_ = 0;
                     while(_loc11_ < this._2889.length)
                     {
                        _loc10_[_loc11_] = param2;
                        _loc11_++;
                     }
                     if(this._2873 == _715.COMIC)
                     {
                        _loc9_ = _469._2980(this._2889[0],_719.LOCAL,[_718.SCALE_Y,_loc10_]);
                        this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc9_));
                     }
                     else
                     {
                        _loc9_ = _469._3476(this._2889,_loc8_,this._2873,_719.LOCAL,[_718.SCALE_Y,_loc10_],1);
                        if(param3)
                        {
                           this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                        }
                        else
                        {
                           _2217._1651();
                           this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                        }
                     }
                  }
               }
               else if(this.model.scaleY == "" || !(this._4793(this.model.scaleY,param2 / _loc6_) && this._4793(this.model.scaleX,param2 / _loc5_)))
               {
                  _loc10_ = [];
                  _loc11_ = 0;
                  while(_loc11_ < this._2889.length)
                  {
                     if(this._2889[_loc11_] is _79)
                     {
                        _loc6_ = _79(this._2889[_loc11_])._2037;
                     }
                     else if(this._2889[_loc11_] is _70)
                     {
                        _loc6_ = _70(this._2889[_loc11_])._1760._2037;
                     }
                     else if(this._2889[_loc11_] is _52)
                     {
                        _loc6_ = _52(this._2889[_loc11_])._1882._2037;
                     }
                     _loc10_[_loc11_] = param2 / _loc6_;
                     _loc11_++;
                  }
                  if(this._2873 == _715.COMIC)
                  {
                     _loc9_ = _469._2980(this._2889[0],_719.LOCAL,[_718.SCALE_Y,_loc10_]);
                     this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc9_));
                  }
                  else
                  {
                     _loc9_ = _469._3476(this._2889,_loc8_,this._2873,_719.LOCAL,[_718.SCALE_Y,_loc10_],1);
                     if(param3)
                     {
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                     else
                     {
                        _2217._1651();
                        this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                     }
                  }
               }
               break;
            case _718.SCALE:
               _loc12_ = param2;
               _loc13_ = param2;
               _loc14_ = [];
               if(this._4798)
               {
                  if(param4)
                  {
                     _loc12_ = Number(param4.scaleX);
                     _loc13_ = Number(param4.scaleY);
                  }
                  if(this.model.scaleY == "" || !(this._4793(this.model.scaleY,param2) && this._4793(this.model.scaleX,_loc12_)))
                  {
                     _loc10_ = [];
                     _loc14_ = [];
                     _loc11_ = 0;
                     while(_loc11_ < this._2889.length)
                     {
                        _loc10_[_loc11_] = _loc12_;
                        _loc11_++;
                     }
                     _loc11_ = 0;
                     while(_loc11_ < this._2889.length)
                     {
                        _loc14_[_loc11_] = _loc13_;
                        _loc11_++;
                     }
                     if(this._2873 == _715.COMIC)
                     {
                        _loc9_ = _469._2980(this._2889[0],_719.LOCAL,[_718.SCALE_Y,_loc10_,_718.SCALE_X,_loc10_]);
                        this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc9_));
                     }
                     else
                     {
                        _loc9_ = _469._3476(this._2889,_loc8_,this._2873,_719.LOCAL,[_718.SCALE_Y,_loc14_,_718.SCALE_X,_loc10_],1);
                        if(param3)
                        {
                           this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                        }
                        else
                        {
                           _2217._1651();
                           this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                        }
                     }
                  }
               }
               else
               {
                  _loc15_ = Boolean(param4.widthChange);
                  _loc16_ = Boolean(param4.heightChange);
                  _loc17_ = Number(param4.scaleRate);
                  if(_loc17_ == 0)
                  {
                     _loc17_ = 1;
                  }
                  if(this.model.scaleY == "" || !this._4793(this.model.scaleY,param2 / _loc6_))
                  {
                     _loc10_ = [];
                     _loc14_ = [];
                     if(_loc16_)
                     {
                        _loc11_ = 0;
                        while(_loc11_ < this._2889.length)
                        {
                           if(this._2889[_loc11_] is _79)
                           {
                              _loc6_ = _79(this._2889[_loc11_])._2037;
                           }
                           else if(this._2889[_loc11_] is _70)
                           {
                              _loc6_ = _70(this._2889[_loc11_])._1760._2037;
                           }
                           else if(this._2889[_loc11_] is _52)
                           {
                              _loc6_ = _52(this._2889[_loc11_])._1882._2037;
                           }
                           _loc14_[_loc11_] = param2 / _loc6_;
                           _loc11_++;
                        }
                        _loc11_ = 0;
                        while(_loc11_ < this._2889.length)
                        {
                           _loc10_[_loc11_] = _loc14_[_loc11_] * _loc17_;
                           _loc11_++;
                        }
                     }
                     else
                     {
                        _loc11_ = 0;
                        while(_loc11_ < this._2889.length)
                        {
                           if(this._2889[_loc11_] is _79)
                           {
                              _loc5_ = _79(this._2889[_loc11_])._2038;
                           }
                           else if(this._2889[_loc11_] is _70)
                           {
                              _loc5_ = _70(this._2889[_loc11_])._1760._2038;
                           }
                           else if(this._2889[_loc11_] is _52)
                           {
                              _loc5_ = _52(this._2889[_loc11_])._1882._2038;
                           }
                           _loc10_[_loc11_] = param2 / _loc5_;
                           _loc11_++;
                        }
                        _loc11_ = 0;
                        while(_loc11_ < this._2889.length)
                        {
                           _loc14_[_loc11_] = _loc10_[_loc11_] / _loc17_;
                           _loc11_++;
                        }
                     }
                     if(this._2873 == _715.COMIC)
                     {
                        _loc9_ = _469._2980(this._2889[0],_719.LOCAL,[_718.SCALE_Y,_loc10_,_718.SCALE_X,_loc10_]);
                        this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc9_));
                     }
                     else
                     {
                        _loc9_ = _469._3476(this._2889,_loc8_,this._2873,_719.LOCAL,[_718.SCALE_Y,_loc14_,_718.SCALE_X,_loc10_],1);
                        if(param3)
                        {
                           this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                        }
                        else
                        {
                           _2217._1651();
                           this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
                        }
                     }
                  }
               }
         }
         if(!param3)
         {
            _2217._1651();
         }
      }
      
      private function _10759(param1:TransformEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc2_:Number = Number(param1.data.value);
         var _loc3_:Boolean = Boolean(param1.data.merge);
         var _loc4_:Number = Number(param1.data.scaleRate);
         switch(param1.type)
         {
            case TransformEvent.ROTATION_CHANGE:
               this._10746(_718.ROTATION,_loc2_,_loc3_);
               break;
            case TransformEvent.X_CHANGE:
               this._10746(_718.X,_loc2_,_loc3_);
               break;
            case TransformEvent.Y_CHANGE:
               this._10746(_718.Y,_loc2_,_loc3_);
               break;
            case TransformEvent.SCALE_X_CHANGE:
               this._4798 = true;
               if(this._13876)
               {
                  if(_loc4_ > 0)
                  {
                     _loc5_ = _loc2_;
                     _loc6_ = _loc2_ / _loc4_;
                  }
                  else
                  {
                     _loc5_ = _loc2_;
                     _loc6_ = _loc2_;
                  }
                  this._10746(_718.SCALE,_loc2_,_loc3_,{
                     "scaleX":_loc5_,
                     "scaleY":_loc6_
                  });
               }
               else
               {
                  this._10746(_718.SCALE_X,_loc2_,_loc3_);
               }
               break;
            case TransformEvent.SCALE_Y_CHANGE:
               this._4798 = true;
               if(this._13876)
               {
                  if(_loc4_ > 0)
                  {
                     _loc5_ = _loc2_ * _loc4_;
                     _loc6_ = _loc2_;
                  }
                  else
                  {
                     _loc5_ = _loc2_;
                     _loc6_ = _loc2_;
                  }
                  this._10746(_718.SCALE,_loc2_,_loc3_,{
                     "scaleX":_loc5_,
                     "scaleY":_loc6_
                  });
               }
               else
               {
                  this._10746(_718.SCALE_Y,_loc2_,_loc3_);
               }
               break;
            case TransformEvent.WIDTH_CHANGE:
               this._4798 = false;
               if(this._13876)
               {
                  this._10746(_718.SCALE,_loc2_,_loc3_,{
                     "widthChange":true,
                     "scaleRate":_loc4_
                  });
               }
               else
               {
                  this._10746(_718.SCALE_X,_loc2_,_loc3_);
               }
               break;
            case TransformEvent.HEIGHT_CHANGE:
               this._4798 = false;
               if(this._13876)
               {
                  this._10746(_718.SCALE,_loc2_,_loc3_,{
                     "heightChange":true,
                     "scaleRate":_loc4_
                  });
               }
               else
               {
                  this._10746(_718.SCALE_Y,_loc2_,_loc3_);
               }
         }
      }
   }
}

