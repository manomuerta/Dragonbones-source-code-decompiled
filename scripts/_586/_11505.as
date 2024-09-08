package _586
{
   import _11500._11499;
   import _11500._11501;
   import _11500._11502;
   import _11500._11503;
   import _11500._11504;
   import _1177.CloseEvent;
   import _127._133;
   import _1374.Alert;
   import _1404._1407;
   import _24.Shortcut;
   import _24._26;
   import _51._70;
   import _51._79;
   import _521._529;
   import _579._578;
   import _579._580;
   import _6._9;
   import _636.DBModelEvent;
   import _658.Mesh;
   import _658._659;
   import _658._661;
   import _703._705;
   import _708._715;
   import _73._74;
   import _783.CommandNotification;
   import _783.MeshNotification;
   import _783.StageNotification;
   import _877._885;
   import _877._887;
   import _93._94;
   import _953._956;
   import egret.utils.tr;
   import flash.geom.Matrix;
   
   public class _11505 extends _94
   {
      public static const TOOL_NONE:int = -1;
      
      public static const TOOL_MODIFY_VERTEX:int = 0;
      
      public static const TOOL_ADD_VERTEX:int = 1;
      
      public static const TOOL_DEL:int = 2;
      
      public static const TOOL_OUTLINE:int = 3;
      
      public static const TOOL_ADD_EDGE:int = 9;
      
      public static const TOOL_DEFAULT:int = 0;
      
      private var _12964:Boolean = true;
      
      private var _11416:_11504;
      
      private var _11413:_11499;
      
      private var _4304:_11502;
      
      private var _11417:_11503;
      
      private var _4308:_11501;
      
      private var _5188:Boolean;
      
      private var _11657:Boolean = true;
      
      private var _5097:_956;
      
      private var _4344:_887;
      
      private var _4211:_885;
      
      private var _4296:_70;
      
      private var _4328:_79;
      
      private var _2123:Mesh;
      
      private var _4210:_659;
      
      private var _11679:Boolean;
      
      private var _11680:Boolean;
      
      private var _zoom:Number = 1;
      
      private var _2205:Matrix;
      
      private var _4331:int = -1;
      
      private var _11681:Boolean;
      
      private var _4318:Boolean;
      
      public function _11505()
      {
         this._11416 = _1407.getInstance(_11504) as _11504;
         this._11413 = _1407.getInstance(_11499) as _11499;
         this._4304 = _1407.getInstance(_11502) as _11502;
         this._11417 = _1407.getInstance(_11503) as _11503;
         super();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(MeshNotification.UPDATE_SELECT_UV,this._5154);
         _1565(MeshNotification.EDIT_UV,this._11690);
         _1565(MeshNotification.STOP_EDIT,this._11429);
         _1565(MeshNotification.RESET_UV,this._11689);
         _1565(MeshNotification.CHANGE_DEFORM,this._11684);
         _1565(MeshNotification.CHANGE_UV_TOOL,this._11683);
         _1565(MeshNotification.END_ADD_OUTLINE,this._11682);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._11678);
         _1565(StageNotification.UPDATE_CURRENT_TOOL,this._10861);
         _1565(MeshNotification.AUTO_UV,this._13896);
         _1565(StageNotification.START_EDIT_MESH_UV,this._11685,1000);
         _1565(StageNotification.STOP_EDIT_MESH_UV,this._11686,1000);
         _1565(StageNotification.GROUP_SELECT,this._13356);
         if(_2214 && _2214._1844 && _2214._1844._2871 && Boolean(_2214._1844._2871._3286))
         {
            this._zoom = _2214._1844._2871._3286.zoom;
         }
         if(Boolean(this._4211) && Boolean(this._4211.stage))
         {
            Shortcut._1681(this._4211.stage,_26.EDIT_MESH,this._11645);
         }
      }
      
      private function _13356(param1:StageNotification) : void
      {
         this._13357();
      }
      
      private function _4305() : void
      {
         if(Boolean(this._4211) && Boolean(this._4211.stage))
         {
            Shortcut._1681(this._4211.stage,_26.MESH_EDIT,this._4311);
            Shortcut._1681(this._4211.stage,_26.MESH_ADD,this._4315);
            Shortcut._1681(this._4211.stage,_26.MESH_DELETE,this._4306);
            this._4318 = true;
         }
      }
      
      private function _4302() : void
      {
         Shortcut._1673(this._4211.stage,_26.MESH_EDIT,this._4311);
         Shortcut._1673(this._4211.stage,_26.MESH_ADD,this._4315);
         Shortcut._1673(this._4211.stage,_26.MESH_DELETE,this._4306);
         this._4318 = false;
      }
      
      private function _11645() : void
      {
         if(_2214 && _2214._1844 && _2214._1844._2873 == _715.ARMATURE && _2226._2889.length == 1 && (_2226._3150 && _2226._3150._2165) && !this._5188)
         {
            _1567(new MeshNotification(MeshNotification.EDIT_UV));
         }
      }
      
      private function _4311() : void
      {
         _1567(new MeshNotification(MeshNotification.CHANGE_UV_TOOL,TOOL_MODIFY_VERTEX));
      }
      
      private function _4315() : void
      {
         _1567(new MeshNotification(MeshNotification.CHANGE_UV_TOOL,TOOL_ADD_VERTEX));
      }
      
      private function _4306() : void
      {
         _1567(new MeshNotification(MeshNotification.CHANGE_UV_TOOL,TOOL_DEL));
      }
      
      private function _10861(param1:StageNotification) : void
      {
         this._13357();
      }
      
      public function _13357() : void
      {
         if(this._5188)
         {
            _1567(new MeshNotification(MeshNotification.STOP_EDIT));
         }
      }
      
      private function _11678(param1:StageNotification) : void
      {
         var _loc2_:_79 = null;
         if(this._5188)
         {
            _loc2_ = this._4328;
            if(_2226._2484 == null)
            {
               this._13894();
               _loc2_ = null;
               this._4328 = null;
            }
            _1567(new MeshNotification(MeshNotification.STOP_EDIT));
            _2226._2484 = _loc2_;
         }
      }
      
      private function _11682(param1:MeshNotification) : void
      {
         this._3187();
      }
      
      public function _3187() : void
      {
         if(this._4296 == null)
         {
            this._11688(TOOL_NONE);
            return;
         }
         if(this._4331 == TOOL_OUTLINE)
         {
            _1567(new MeshNotification(MeshNotification.CHANGE_UV_TOOL,TOOL_MODIFY_VERTEX));
         }
      }
      
      private function _13896(param1:MeshNotification) : void
      {
         var onCloseBtnClick:Function = null;
         var checkFunction:Function = null;
         var e:MeshNotification = param1;
         onCloseBtnClick = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.FIRST_BUTTON)
            {
               _13895(e.data);
            }
         };
         checkFunction = function(param1:DBModelEvent):void
         {
            _12964 = !param1.data;
         };
         _133.show(tr("AutoMesh.content"),tr("AutoMesh.title"),null,onCloseBtnClick,tr("Alert.Confirm"),tr("Alert.Cancel"),"",this._12964,checkFunction);
      }
      
      private function _13895(param1:int) : void
      {
         this._12672._3024();
         if(this._4331 == TOOL_OUTLINE)
         {
            this._3187();
         }
         if(Boolean(this._4328) && Boolean(this._2123))
         {
            _1567(new CommandNotification(CommandNotification.AUTO_ORIGIN,{
               "_1837":this._4328,
               "mesh":this._2123,
               "density":param1
            }));
         }
      }
      
      private function _11689(param1:MeshNotification) : void
      {
         var onCloseBtnClick:Function = null;
         var checkFunction:Function = null;
         var e:MeshNotification = param1;
         onCloseBtnClick = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.FIRST_BUTTON)
            {
               _4329();
            }
         };
         checkFunction = function(param1:DBModelEvent):void
         {
            _12964 = !param1.data;
         };
         _133.show(tr("ResetMesh.content"),tr("ResetMesh.title"),null,onCloseBtnClick,tr("Alert.Confirm"),tr("Alert.Cancel"),"",this._12964,checkFunction);
      }
      
      private function _4329() : void
      {
         this._12672._3024();
         if(this._4331 == TOOL_OUTLINE)
         {
            this._3187();
         }
         if(this._4328 && this._2123 && !this._2123._4326())
         {
            _1567(new CommandNotification(CommandNotification.RESET_ORIGIN,{
               "_1837":this._4328,
               "mesh":this._2123
            }));
         }
      }
      
      private function _13894() : void
      {
         if(Boolean(this._4328) && this._4328._13687 != null)
         {
            this._4328._13687 = null;
            this._4328._1751();
            if(this._4211)
            {
               this._4211._12947();
               this._4211._2466();
            }
            _1567(new StageNotification(StageNotification.UPDATE_SLOT_DOWN_LAYER));
         }
      }
      
      private function _13893() : void
      {
         if(this._4328 && this._4296 && this._4328._2049 != this._4296)
         {
            this._4328._13687 = this._4296;
            this._4328._1751();
            if(this._4211)
            {
               this._4211._12947();
               this._4211._2466();
            }
         }
      }
      
      private function _11684(param1:MeshNotification) : void
      {
         this._11657 = param1.data;
         this._13893();
         this._4211._11662 = this._11657;
         if(this._4308)
         {
            if(this._4308 == this._11417 && this._11657)
            {
               _1567(new MeshNotification(MeshNotification.CHANGE_UV_TOOL,TOOL_MODIFY_VERTEX));
            }
            this._4308._11662 = this._11657;
            this._3139();
         }
         this._3331._3286.visibleFilter._11294 = !this._11657;
         _1567(new StageNotification(StageNotification.UPDATE_FILTER_STATUS));
      }
      
      private function _11683(param1:MeshNotification) : void
      {
         if(this._5188)
         {
            this._11688(param1.data);
         }
      }
      
      private function _11688(param1:int) : void
      {
         var onCloseBtnClick:Function;
         var checkFunction:Function;
         var data:int = param1;
         if(data == TOOL_OUTLINE)
         {
            onCloseBtnClick = function(param1:CloseEvent):void
            {
               if(param1.detail == Alert.FIRST_BUTTON)
               {
                  _4331 = data;
                  if(_11657)
                  {
                     _1567(new MeshNotification(MeshNotification.CHANGE_DEFORM,false));
                     _11681 = true;
                  }
                  _11421 = _11417;
               }
               else
               {
                  data = _4331;
                  _1567(new MeshNotification(MeshNotification.CHANGE_UV_TOOL,_4331));
               }
            };
            checkFunction = function(param1:DBModelEvent):void
            {
               _12964 = !param1.data;
            };
            if(this._4331 == data)
            {
               _1567(new MeshNotification(MeshNotification.CHANGE_UV_TOOL,TOOL_MODIFY_VERTEX));
               return;
            }
            _133.show(tr("OutlineMesh.content"),tr("OutlineMesh.title"),null,onCloseBtnClick,tr("Alert.Confirm"),tr("Alert.Cancel"),"",this._12964,checkFunction);
         }
         else
         {
            if(this._4331 == data)
            {
               return;
            }
            this._4331 = data;
            switch(data)
            {
               case TOOL_MODIFY_VERTEX:
                  this._11421 = this._11416;
                  break;
               case TOOL_ADD_VERTEX:
                  this._11421 = this._11413;
                  break;
               case TOOL_DEL:
                  this._11421 = this._4304;
                  break;
               case TOOL_OUTLINE:
                  this._11421 = this._11417;
                  break;
               default:
                  this._11421 = null;
            }
            if(this._11681)
            {
               this._11681 = false;
               _1567(new MeshNotification(MeshNotification.CHANGE_DEFORM,true));
            }
         }
      }
      
      public function _3173() : void
      {
         if(this._4210 == null)
         {
            return;
         }
         this._4210.invalid = false;
         this._4210._2466();
         if(this._4308)
         {
            this._4308._3173();
         }
         this._3139();
         this._3176._11643();
      }
      
      private function _5154(param1:MeshNotification) : void
      {
         this._3139();
      }
      
      public function _5170(param1:Number) : void
      {
         this._zoom = param1;
         if(!this._5188)
         {
            return;
         }
         if(this._4211)
         {
            this._4211._2466();
         }
         this._4210.scale = this._zoom;
         this._3139();
      }
      
      public function _4906(param1:_885, param2:_956, param3:_887) : void
      {
         if(!this._5097)
         {
         }
         this._4269 = param1;
         this._5097 = param2;
         this._4313 = param3;
         this._11416._4906(param1,param2,param3);
         this._11413._4906(param1,param2,param3);
         this._4304._4906(param1,param2,param3);
         this._11417._4906(param1,param2,param3);
      }
      
      public function set _4313(param1:_887) : void
      {
         this._4344 = param1;
         if(this._4211)
         {
            this._4344._2026 = this._4211._2162;
         }
      }
      
      public function set _4269(param1:_885) : void
      {
         this._4211 = param1;
         if(this._4344)
         {
            this._4344._2026 = this._4211.transform.matrix;
         }
      }
      
      private function _11686(param1:_9) : void
      {
         this._5188 = false;
         this._4302();
         this._4331 = -1;
         this._11421 = null;
         this._4211._4238 = null;
      }
      
      private function _11685(param1:StageNotification) : void
      {
         this._5188 = true;
         this._4305();
         _1567(new MeshNotification(MeshNotification.CHANGE_DEFORM,this._11657));
         this._4211._11662 = this._11657;
         this._4211._4238 = this._4210;
         _1567(new MeshNotification(MeshNotification.CHANGE_UV_TOOL,TOOL_MODIFY_VERTEX));
      }
      
      private function _11429(param1:MeshNotification) : void
      {
         if(this._5188)
         {
            this._13894();
            this._3331._3286.visibleFilter._11294 = false;
            _1567(new StageNotification(StageNotification.UPDATE_FILTER_STATUS));
            this.editing = false;
         }
      }
      
      private function _11690(param1:MeshNotification) : void
      {
         if(_2220._2873 != _715.ARMATURE)
         {
            return;
         }
         if(this._5188)
         {
            _1567(new MeshNotification(MeshNotification.STOP_EDIT));
         }
         else
         {
            _1567(new MeshNotification(MeshNotification.CHANGE_DEFORM,this._11657));
            this.editing = !this._5188;
         }
      }
      
      public function set _11421(param1:_11501) : void
      {
         if(this._4308 == param1)
         {
            return;
         }
         if(this._4308)
         {
            this._4308.stop();
         }
         this._4308 = param1;
         if(this._4308)
         {
            this._4308._11662 = this._11657;
            this._4308._4242(this._4210,this._4328);
            this._4308.start();
         }
      }
      
      public function get editing() : Boolean
      {
         return this._5188;
      }
      
      public function set editing(param1:Boolean) : void
      {
         if(this._5188 != param1)
         {
            this._5188 = param1;
            this._11687();
            if(this._5188)
            {
               if(this._4296 && this._2123 && Boolean(this._4210))
               {
                  _1567(new StageNotification(StageNotification.START_EDIT_MESH_UV));
               }
               else
               {
                  this._5188 = false;
               }
            }
            else
            {
               _1567(new StageNotification(StageNotification.STOP_EDIT_MESH_UV));
            }
         }
      }
      
      private function _11687() : void
      {
         if(_2226._2889.length == 1)
         {
            if(_2226._2484 is _79 && (_2226._2484 as _79)._2049 && (_2226._2484 as _79)._2049.type == _74.MESH)
            {
               this._1838 = (_2226._2484 as _79)._2049 as _70;
            }
            else if(_2226._2484 is _70 && (_2226._2484 as _70).type == _74.MESH)
            {
               this._1838 = _2226._2484 as _70;
            }
            else
            {
               this._1838 = null;
            }
         }
         else
         {
            this._1838 = null;
         }
      }
      
      public function get _1838() : _70
      {
         return this._4296;
      }
      
      private function get _4238() : _659
      {
         var _loc1_:_659 = _705._3776[this._4296];
         if(_loc1_ == null)
         {
            _loc1_ = new _659(this._4296);
            _705._3776[this._4296] = _loc1_;
         }
         return _loc1_;
      }
      
      public function set _1838(param1:_70) : void
      {
         if(Boolean(param1) && (param1.type != _74.MESH || param1.mesh == null))
         {
            param1 = null;
         }
         if(this._4296 != param1)
         {
            this._4296 = param1;
            if(this._4296)
            {
               this._2123 = this._4296.mesh;
               this._4210 = this._4238;
               this._4328 = this._4296._1760;
            }
            else
            {
               this._2123 = null;
               if(this._4210)
               {
                  this._4210.clear();
               }
               this._13894();
               this._4210 = null;
               this._4328 = null;
            }
         }
      }
      
      public function _3139() : void
      {
         var _loc1_:Matrix = null;
         if(this._4344._1897)
         {
            if(this._11657 && Boolean(this._4211._2162))
            {
               this._2205 = this._4211._2162.clone();
               _loc1_ = this._4211.transform.matrix.clone();
               _loc1_.a = this._zoom;
               _loc1_.d = this._zoom;
               this._2205.concat(_loc1_);
               this._4344._2026 = this._2205;
               this._4344._1751();
            }
            else if(this._4211._11656)
            {
               this._2205 = this._4211._11656.clone();
               this._2205.a = 1;
               this._2205.b = 0;
               this._2205.c = 0;
               this._2205.d = 1;
               _loc1_ = this._4211.transform.matrix.clone();
               _loc1_.a = this._zoom;
               _loc1_.d = this._zoom;
               this._2205.concat(_loc1_);
               this._4344._2026 = this._2205;
               this._4344._1751();
            }
         }
      }
      
      public function _3170(param1:_661, param2:_661) : void
      {
         if(this._4331 == TOOL_OUTLINE)
         {
            this._11417.execute(param1,param2);
         }
      }
      
      public function _3171() : void
      {
         if(this._4331 == TOOL_OUTLINE)
         {
            this._11417.revert();
         }
      }
      
      protected function get _12672() : _529
      {
         return _1407.getInstance(_529) as _529;
      }
      
      protected function get _3331() : _578
      {
         return _1407.getInstance(_578) as _578;
      }
      
      protected function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
   }
}

