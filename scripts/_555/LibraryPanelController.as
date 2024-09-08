package _555
{
   import _1009.SwapImageWindow;
   import _1009._14121;
   import _1021._14119;
   import _1021._14120;
   import _1038._1042;
   import _1045.Group;
   import _1088.TreeItemRenderer;
   import _11106._11108;
   import _11111._11110;
   import _1177.CloseEvent;
   import _1177.ListEvent;
   import _1177.UIEvent;
   import _127._133;
   import _127._163;
   import _1374.Alert;
   import _1404._1407;
   import _14075._14077;
   import _1421.TreeDragEvent;
   import _14255._14259;
   import _15.DBDragFormat;
   import _172._174;
   import _204._212;
   import _24.Shortcut;
   import _24._26;
   import _35._13488;
   import _354._353;
   import _470._469;
   import _472._14071;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._71;
   import _51._79;
   import _521._528;
   import _541._540;
   import _586._606;
   import _6.Context;
   import _625._627;
   import _625._630;
   import _636.DBModelEvent;
   import _636.LibraryEvent;
   import _648._650;
   import _648._665;
   import _668._670;
   import _692._13549;
   import _692._691;
   import _692._693;
   import _692._694;
   import _692._695;
   import _692._696;
   import _703._702;
   import _703._704;
   import _708._715;
   import _708._717;
   import _710._711;
   import _710._712;
   import _721._763;
   import _724._13550;
   import _724._14084;
   import _724._14085;
   import _724._14086;
   import _724._725;
   import _724._728;
   import _724._729;
   import _724._731;
   import _724._737;
   import _724._738;
   import _73.SymbolType;
   import _73._74;
   import _777._779;
   import _783.ComicNotification;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _783.TipNotification;
   import _859.LibraryPanel;
   import _859._861;
   import _859._862;
   import _93._94;
   import _97._118;
   import _97._124;
   import _97._14037;
   import egret.core._1111;
   import egret.managers.DragManager;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.desktop.NativeApplication;
   import flash.desktop.NativeDragActions;
   import flash.desktop.NativeDragManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.NativeDragEvent;
   import flash.filesystem.File;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import flash.utils.ByteArray;
   
   public class LibraryPanelController extends _94
   {
      public static const MAX_FILE_SIZE:int = 10000000;
      
      public static const MAX_FILE_NUM:int = 100;
      
      private var _4158:_670;
      
      private var libraryPanel:LibraryPanel;
      
      private var _4163:TreeItemRenderer;
      
      private var _4192:Vector.<_691>;
      
      private var _11618:Object;
      
      private var _14554:_14120;
      
      private var _14546:Boolean = false;
      
      private var _14553:_14121;
      
      private var _14547:_79;
      
      private var _4186:int;
      
      private var stageDragCallBack:Function;
      
      private var isCreateSkeleton:Boolean = false;
      
      private var lastPath:String = "";
      
      private var moveCount:int = 0;
      
      public function LibraryPanelController()
      {
         this._4158 = new _670();
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.libraryPanel = _1407.getInstance(LibraryPanel);
      }
      
      override protected function _1576() : void
      {
         this.tree._3854 = true;
         this.tree.addEventListener(ListEvent.ITEM_MOUSE_DOWN,this.tree_onItemMouseDown);
         this.tree.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,this.tree_onDoubleClick);
         this.tree.addEventListener(ListEvent.ITEM_RIGHT_MOUSE_DOWN,this._4165);
         if(this.libraryPanel._11321)
         {
            this._4200(null);
         }
         else
         {
            this.libraryPanel.addEventListener(UIEvent.CREATION_COMPLETE,this._4200);
         }
         NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE,this._4172);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         _1565(StageNotification.CHECK_CURRENT_ARMATURE,this._4143);
         _1565(PanelNotification.DELETE_ARMATURE,this.onDeleteArmature);
         _1565(StageNotification.SWAP_IMAGE,this._14543);
         _1565(MenuNotification.SHOW_IN_EXPLORER,this._4146);
         _1565(MenuNotification.IMPORT_ASSET,this._4180);
         _1565(MenuNotification.RENAME,this._4006);
         _1565(MenuNotification.RELOCATE_PATH,this._4150);
         _1565(MenuNotification.NEW_SYMBOL,this._4164);
         _1565(MenuNotification.EXPORT,this._4181);
         _1565(MenuNotification.DELETE_ARMATURE,this._4145);
         _1565(MenuNotification.DUPLICATE,this._13275);
         _1565(MenuNotification.SWAP_IMAGE,this._10507);
         _1565(MenuNotification.DELETE_VITUAL_FOLDER,this.onRightDeleteVitualFolder);
         this.libraryPanel.addEventListener(KeyboardEvent.KEY_UP,this._4517,false);
         this.tree.addEventListener(TreeDragEvent.ITEMS_DRAG_IN_COMPLETE,this._4453);
         this.tree.addEventListener(TreeDragEvent.ITEMS_DRAG_MOVE_COMPLETE,this._4117);
         Shortcut._1681(this.libraryPanel,_26.RENAME,this._15583);
         Shortcut._1681(this.libraryPanel,_26.DUPLICATE,this._4014);
      }
      
      private function _15583() : void
      {
         this.rename(this.libraryPanel.tree._2484);
      }
      
      private function _4014() : void
      {
         this._1567(new MenuNotification(MenuNotification.DUPLICATE,null,"librarypanel"));
      }
      
      private function _4453(param1:TreeDragEvent) : void
      {
         var _loc6_:_702 = null;
         var _loc7_:Object = null;
         var _loc2_:Array = param1._3597;
         var _loc3_:_702 = param1._4137 as _702;
         var _loc4_:Object = _loc3_.vo;
         var _loc5_:Array = [];
         for each(_loc6_ in param1._3597)
         {
            if(_loc6_ is _13549)
            {
               _loc5_.push(_loc6_.vo);
            }
            else if(_loc6_ is _694)
            {
               _loc5_.push(_loc6_.vo._1886);
            }
         }
         _loc7_ = _469._13766(_loc5_,_loc4_ as _13550);
         _1567(new CommandNotification(CommandNotification.SET_LIBRARYNODEMODEL_PARENT,_loc7_));
      }
      
      private function _4117(param1:TreeDragEvent) : void
      {
         var _loc2_:_702 = param1._3597[0];
         var _loc3_:_702 = (param1._4137 as _702).parent;
      }
      
      private function _4517(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER && param1.currentTarget is LibraryPanel && param1.target is LibraryPanel)
         {
            this.libraryPanel._13786._4537();
            this.libraryPanel._13786._4516();
            this.libraryPanel._13786._3514();
         }
      }
      
      public function _3514() : void
      {
         if(this.libraryPanel._13786)
         {
            this.libraryPanel._13786._3514();
         }
      }
      
      private function _13275(param1:MenuNotification) : void
      {
         var _loc2_:_50 = null;
         if(param1.data != "librarypanel")
         {
            return;
         }
         if(this.libraryPanel.tree._2889.length == 1 && this.libraryPanel.tree._2484 is _694)
         {
            _loc2_ = (this.libraryPanel.tree._2484 as _694)._4161._1886;
            if(_loc2_)
            {
               this.duplicateArmature(_loc2_);
            }
         }
      }
      
      private function _14543(param1:StageNotification) : void
      {
         var _loc2_:_70 = null;
         this._14547 = param1.data as _79;
         if(this._14547)
         {
            _loc2_ = this._14547._2049;
         }
         if(Boolean(this._14547) && Boolean(_loc2_))
         {
            this.libraryPanel._13786._14549();
            this._14553 = new _14121();
            this._14553._4158 = this._4158;
            this._14553.addEventListener(LibraryEvent.IMPORT,this._3306);
            this._14553.addEventListener(MouseEvent.CLICK,this._14542);
            this._14553.addEventListener(MouseEvent.CLICK,this._14545);
            this._14553.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,this._9811);
            this._14553.open();
         }
      }
      
      private function _9811(param1:ListEvent) : void
      {
         this.changeAsset();
      }
      
      private function _14542(param1:MouseEvent) : void
      {
         if(this._14553 == null || param1.target != this._14553._5554)
         {
            return;
         }
         this.changeAsset();
      }
      
      private function changeAsset() : void
      {
         var _loc2_:Object = null;
         var _loc1_:_725 = this._2106._3806(this._14553._14548);
         if(_loc1_ != null)
         {
            _loc2_ = {};
            _loc2_._1837 = this._14547;
            _loc2_.displayVO = this._14547._2049;
            _loc2_._10500 = this._14547._2049._2104;
            _loc2_._10499 = _loc1_;
            _1567(new CommandNotification(CommandNotification.MODIFY_DISPLAY_ASSET,_loc2_));
         }
         _779.instance._10505();
         this._14553.close();
         this._14540();
      }
      
      private function _14545(param1:MouseEvent) : void
      {
         if(this._14553 == null || param1.target != this._14553._5555)
         {
            return;
         }
         this._14553.close();
         this._14540();
      }
      
      private function _14540() : void
      {
         this._14553._14544();
         this._14553._14552.dispose();
         this._14553._14552 = null;
         this._14553._4158 = null;
         this._14553.removeEventListener(LibraryEvent.IMPORT,this._3306);
         this._14553.removeEventListener(MouseEvent.CLICK,this._14542);
         this._14553.removeEventListener(MouseEvent.CLICK,this._14545);
         this._14553.removeEventListener(ListEvent.ITEM_DOUBLE_CLICK,this._9811);
         this._14553 = null;
      }
      
      private function _10504(param1:StageNotification) : void
      {
         var _1837:_79 = null;
         var displayVO:_70 = null;
         var w:SwapImageWindow = null;
         var e:StageNotification = param1;
         _1837 = e.data as _79;
         if(_1837)
         {
            displayVO = _1837._2049;
         }
         if(Boolean(_1837) && Boolean(displayVO))
         {
            w = new SwapImageWindow(function(param1:File):void
            {
               var _loc4_:* = undefined;
               var _loc5_:* = undefined;
               var _loc6_:* = undefined;
               var _loc7_:* = undefined;
               var _loc8_:* = undefined;
               var _loc9_:* = undefined;
               var _loc2_:* = FileUtil.getFileName(param1.nativePath);
               if(!hasFile(FileUtil.escapePath(param1.nativePath)))
               {
                  _loc4_ = _loc2_ + ".png";
                  _loc5_ = _loc2_ + ".jpg";
                  if(existFileName(_loc4_) || existFileName(_loc5_))
                  {
                     _loc6_ = 0;
                     _loc7_ = _loc2_;
                     _loc8_ = FileUtil.getExtension(param1.nativePath);
                     _loc2_ = _loc7_ + "_" + ++_loc6_ + "." + _loc8_;
                     _loc4_ = _loc7_ + "_" + _loc6_ + ".png";
                     _loc5_ = _loc7_ + "_" + _loc6_ + ".jpg";
                     while(existFileName(_loc4_) || existFileName(_loc5_))
                     {
                        _loc2_ = _loc7_ + "_" + ++_loc6_ + "." + _loc8_;
                        _loc4_ = _loc7_ + "_" + _loc6_ + ".png";
                        _loc5_ = _loc7_ + "_" + _loc6_ + ".jpg";
                     }
                     saveToLibrary(param1,true,_loc2_);
                     _loc2_ = FileUtil.getFileName(_loc2_);
                  }
                  else
                  {
                     _3676([param1],true);
                  }
                  _4188();
               }
               else if(Boolean(_2106) && Boolean(_2106._3814))
               {
                  _loc2_ = _11093(_2106._3814._2682,param1.nativePath);
               }
               var _loc3_:* = _2106._3806(_loc2_);
               if(_loc3_ != null)
               {
                  (_loc9_ = {})._1837 = _1837;
                  _loc9_.displayVO = displayVO;
                  _loc9_._10500 = displayVO._2104;
                  _loc9_._10499 = _loc3_;
                  _1567(new CommandNotification(CommandNotification.MODIFY_DISPLAY_ASSET,_loc9_));
               }
               _779.instance._10505();
            });
            w.open();
         }
      }
      
      private function _11093(param1:String, param2:String) : String
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc3_:String = FileUtil.escapePath(param1);
         var _loc4_:String = FileUtil.escapePath(param2);
         if(_loc4_.indexOf(_loc3_) != -1)
         {
            _loc5_ = _loc4_.substring(_loc3_.length,_loc4_.length);
            if((_loc6_ = int(_loc5_.lastIndexOf("."))) > 0)
            {
               _loc5_ = _loc5_.substring(0,_loc6_);
            }
            return _loc5_;
         }
         return FileUtil.getFileName(param2);
      }
      
      private function _10507(param1:MenuNotification) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_70 = null;
         _loc2_ = _2226._3150;
         if(_loc2_)
         {
            _1567(new StageNotification(StageNotification.SWAP_IMAGE,_loc2_));
         }
      }
      
      public function _3111() : void
      {
         FileUtil.browseForOpen(this._4144,2,_650._4169,tr("BasePage.SelectProjectPath"));
      }
      
      private function _4144(param1:Array) : void
      {
         var files:Array = param1;
         this.saveFilesToLibrarySafely(files,function():void
         {
            var _loc5_:_725 = null;
            var _loc1_:Array = [];
            var _loc2_:Array = [];
            var _loc3_:int = 0;
            var _loc4_:int = int(files.length);
            while(_loc3_ < _loc4_)
            {
               _loc1_.push(FileUtil.getFileName(files[_loc3_].name));
               _loc3_++;
            }
            _loc3_ = 0;
            _loc4_ = int(_loc1_.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _2106._3806(_loc1_[_loc3_]);
               if(_loc5_)
               {
                  _loc2_.push(_loc5_);
               }
               _loc3_++;
            }
            if(_loc2_.length > 0)
            {
               _1567(new ComicNotification(ComicNotification.IMPORT_ASSETS_TO_STAGE,_loc2_));
            }
         });
      }
      
      private function _4145(param1:MenuNotification) : void
      {
         this.onDeleteArmature(null);
      }
      
      private function _4181(param1:MenuNotification) : void
      {
         _1567(new CommandNotification(CommandNotification.SHOW_EXPORT_WINDOW,true));
      }
      
      private function _4164(param1:MenuNotification) : void
      {
         _11110.instance._11320._11130(_11108.LibraryContextMenu);
         this.showNewSymbolWindow();
      }
      
      private function _4150(param1:MenuNotification) : void
      {
         this.onChangeLibraryPath(null);
      }
      
      private function _4006(param1:MenuNotification) : void
      {
         if(param1.data == "libraryPanel")
         {
            this._4199(null);
         }
      }
      
      private function _4180(param1:MenuNotification) : void
      {
         this.openImportAssetsDialog();
      }
      
      private function _4146(param1:MenuNotification) : void
      {
         var _loc2_:String = null;
         var _loc3_:File = null;
         if(param1.data is _691)
         {
            if((param1.data as _691)._4204 is _737)
            {
               _loc2_ = ((param1.data as _691)._4204 as _737).parent._2682;
            }
            else
            {
               _loc2_ = (param1.data as _691)._4204._2682;
            }
            _loc2_ = FileUtil.escapePath(_loc2_);
            _loc2_ = FileUtil.getDirectory(_loc2_);
         }
         if(_loc2_)
         {
            _loc3_ = new File(_loc2_);
            if(Boolean(_loc3_.exists) && Boolean(_loc3_.isDirectory))
            {
               _loc3_.openWithDefaultApplication();
            }
         }
      }
      
      private function _4165(param1:ListEvent) : void
      {
         this.tree._2484 = param1.item;
         if(param1.item is _695)
         {
            this._3975._3934(_711.LIBRARY_PANEL,_712.FOLDER,[param1.item]);
         }
         else if(param1.item is _694)
         {
            this._3975._3934(_711.LIBRARY_PANEL,_712.ARMATURE,[param1.item]);
         }
         else if(param1.item is _691)
         {
            this._3975._3934(_711.LIBRARY_PANEL,_712.ASSET,[param1.item]);
         }
         else if(param1.item is _13549)
         {
            this._3975._3934(_711.LIBRARY_PANEL,_712.VITUALFOLDER,[param1.item]);
         }
      }
      
      private function _4143(param1:StageNotification) : void
      {
         var _loc2_:_50 = this._4158._2871._2865;
         this._2106._3278(_loc2_);
         _1567(new StageNotification(StageNotification.UPDATE_LIBRARY));
      }
      
      private function _3973(param1:StageNotification) : void
      {
         var _loc2_:_50 = this._4158._2871._2865;
         this._4158._4154(_loc2_.name);
         this._2106._3278(_loc2_);
         this.libraryPanel.tree._2484 = this._3678._4162;
         this._4141();
         this._4171();
      }
      
      private function _4141() : void
      {
         this._4158._4149._4141();
      }
      
      private function _4200(param1:UIEvent) : void
      {
         this.libraryPanel.removeEventListener(UIEvent.CREATION_COMPLETE,this._4200);
         this.libraryPanel._11321.addEventListener(MouseEvent.CLICK,this.newSymbolBtn_onClick);
         this.libraryPanel._4196.addEventListener(MouseEvent.CLICK,this._4199);
         this.libraryPanel._13792.addEventListener(MouseEvent.CLICK,this._13789);
         this.libraryPanel._4197.addEventListener(MouseEvent.CLICK,this._4179);
         this.libraryPanel._4190.addEventListener(MouseEvent.CLICK,this._4195);
         this.libraryPanel.addEventListener(LibraryEvent.CHANGE_PATH,this.onChangeLibraryPath);
         this.libraryPanel.addEventListener(LibraryEvent.IMPORT,this._3306);
         this.libraryPanel.addEventListener(LibraryEvent.REFRESH,this._4195);
         this.libraryPanel.addEventListener(LibraryEvent.OPEN_IN_BROWSER,this.onOpen);
         this.libraryPanel.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,this._9808);
         this.libraryPanel.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP,this._4532);
         this.libraryPanel.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,this._4531);
         this.libraryPanel.tree.addEventListener(ListEvent.ITEM_ROLL_OVER,this._4124);
         this.libraryPanel.tree.addEventListener(ListEvent.ITEM_ROLL_OUT,this._4125);
         this.libraryPanel.tree.addEventListener(Event.CHANGE,this._4184);
         this.libraryPanel.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._4166);
         this._4171();
      }
      
      private function _4166(param1:MouseEvent) : void
      {
         if(param1.target is Group)
         {
            this._3975._3934(_711.LIBRARY_PANEL,_712.BLANK);
         }
      }
      
      private function _4184(param1:Event) : void
      {
         this._4171();
      }
      
      private function _4171() : void
      {
         if(this.libraryPanel)
         {
            if(this.libraryPanel._4196)
            {
               this.libraryPanel._4196.enabled = false;
               this.libraryPanel._4197.enabled = this.checkDeleteArmature();
            }
         }
      }
      
      private function _4179(param1:MouseEvent) : void
      {
         this.onDeleteArmature(null);
      }
      
      private function _4199(param1:MouseEvent) : void
      {
         this.rename(this.libraryPanel.tree._2484);
      }
      
      private function _13789(param1:MouseEvent) : void
      {
         this.createVitualFolder();
      }
      
      private function rename(param1:_702) : void
      {
         var curName:String = null;
         var normalizeName:Boolean = false;
         var isFolderName:Boolean = false;
         var isSubTexture:Boolean = false;
         var isVitualFolderName:Boolean = false;
         var namePrefix:String = null;
         var _5851:String = null;
         var renameDialog:_174 = null;
         var onKeyDown:Function = null;
         var onRenameClose:Function = null;
         var _4204:_725 = null;
         var tempArr:Array = null;
         var folderPath:String = null;
         var tempLen:int = 0;
         var treeNode:_702 = param1;
         onKeyDown = function(param1:KeyboardEvent):void
         {
            if(param1.keyCode == 13)
            {
               renameDialog.close();
            }
         };
         var checkSameName:Function = function(param1:String):String
         {
            var _loc2_:String = null;
            var _loc3_:_50 = null;
            var _loc4_:_71 = null;
            var _loc5_:_725 = null;
            var _loc6_:String = null;
            var _loc7_:String = null;
            var _loc8_:String = null;
            var _loc9_:String = null;
            var _loc10_:_738 = null;
            if(treeNode is _694)
            {
               _loc3_ = (treeNode as _694)._4161._1886;
               _loc4_ = _2214._1844._2871.dragonBonesVO;
               if(_loc4_._2129(param1))
               {
                  _loc2_ = tr("Rename.bone.same");
               }
            }
            else if(treeNode is _13549)
            {
               if(checkNewVitualFolderName(param1))
               {
                  _loc2_ = tr("Rename.bone.same");
               }
            }
            else if(treeNode is _691)
            {
               _loc5_ = (treeNode as _691)._4204;
               if(_loc5_ is _731)
               {
                  _loc6_ = FileUtil.escapeUrl(_loc5_._2682);
                  _loc7_ = _loc5_.name;
                  _loc8_ = namePrefix == "" ? param1 : namePrefix + "/" + param1;
                  _loc9_ = _loc6_.replace(_loc7_,_loc8_);
                  if(_3678._3811._10582(_loc9_))
                  {
                     _loc2_ = tr("Rename.bone.same");
                  }
               }
               else if(_loc5_ is _728)
               {
                  _loc9_ = _5851 + namePrefix + param1;
                  if(_3678._3811._4185(_loc9_))
                  {
                     _loc2_ = tr("Rename.bone.same");
                  }
               }
               else if(_loc5_ is _738)
               {
                  _loc6_ = FileUtil.getDirectory(_loc5_._2682);
                  _loc7_ = curName;
                  _loc8_ = param1;
                  _loc9_ = _loc6_ + _loc8_;
                  if(_3678._3811._10582(_loc9_))
                  {
                     _loc2_ = tr("Rename.bone.same");
                  }
               }
               else if(_loc5_ is _737)
               {
                  _loc10_ = (_loc5_ as _737).parent;
                  if(_loc10_)
                  {
                     if(_loc10_._10583(param1))
                     {
                        _loc2_ = tr("Rename.bone.same");
                     }
                  }
                  else
                  {
                     _loc2_ = tr("Rename.illegal.fileName");
                  }
               }
            }
            return _loc2_;
         };
         onRenameClose = function(param1:Event):void
         {
            _10746();
         };
         var _10746:Function = function():void
         {
            var _loc2_:Object = null;
            var _loc3_:String = null;
            var _loc4_:_725 = null;
            var _loc5_:Object = null;
            var _loc6_:String = null;
            var _loc7_:String = null;
            var _loc8_:Vector.<String> = null;
            var _loc9_:Vector.<String> = null;
            var _loc10_:int = 0;
            var _loc11_:int = 0;
            var _loc12_:String = null;
            var _loc13_:_738 = null;
            if(renameDialog.value == null || renameDialog.value == "" || Boolean(checkSameName(renameDialog.value)))
            {
               return;
            }
            var _loc1_:String = renameDialog.value;
            if(treeNode is _694)
            {
               _loc2_ = (treeNode as _694)._4161._1886;
               _loc3_ = CommandNotification.MODIFY_ARMATURE_NAME;
               if(_loc2_)
               {
                  _1567(new CommandNotification(_loc3_,_469._3493(_loc2_,_loc1_)));
               }
            }
            else if(treeNode is _13549)
            {
               _loc2_ = (treeNode as _13549).vo;
               _loc3_ = CommandNotification.MODIFY_VITUALFOLDER_NAME;
               if(_loc2_)
               {
                  _1567(new CommandNotification(_loc3_,_469._13764(_loc2_,_loc1_)));
               }
            }
            else if(treeNode is _691)
            {
               _loc4_ = (treeNode as _691)._4204;
               if(_loc4_ is _731)
               {
                  _loc5_ = {};
                  _loc6_ = namePrefix == "" ? _loc1_ : namePrefix + "/" + _loc1_;
                  _loc5_.imageFile = true;
                  _loc5_._10573 = _loc4_._2682;
                  _loc5_._2952 = _loc4_.path;
                  _loc5_.newPath = _loc4_._2682.replace(_loc4_.path,_loc6_);
                  _loc5_.newName = _loc6_;
                  _1567(new CommandNotification(CommandNotification.RENAME_LIBRARY_ASSETS,_loc5_));
               }
               else if(_loc4_ is _728)
               {
                  (_loc5_ = {}).folderFile = true;
                  _loc7_ = namePrefix.substr(1);
                  if(_loc7_ == null)
                  {
                     _loc7_ = "";
                  }
                  _loc5_._10573 = _loc4_._2682;
                  _loc5_._2952 = _loc7_ + _loc4_.name;
                  _loc5_.newPath = _5851 + namePrefix + _loc1_;
                  _loc5_.newName = _loc7_ + _loc1_;
                  _1567(new CommandNotification(CommandNotification.RENAME_LIBRARY_ASSETS,_loc5_));
               }
               else if(_loc4_ is _738)
               {
                  (_loc5_ = {}).textureFile = true;
                  _loc8_ = _loc4_._10584();
                  _loc9_ = new Vector.<String>();
                  _loc10_ = 0;
                  _loc11_ = int(_loc8_.length);
                  while(_loc10_ < _loc11_)
                  {
                     _loc12_ = FileUtil.getDirectory(_loc8_[_loc10_]) + _loc1_ + "." + FileUtil.getExtension(_loc8_[_loc10_]);
                     _loc9_.push(_loc12_);
                     _loc10_++;
                  }
                  _loc6_ = namePrefix == "" ? _loc1_ : namePrefix + "/" + _loc1_;
                  _loc5_._10571 = _loc8_;
                  _loc5_._2952 = _loc4_.name;
                  _loc5_._10572 = _loc9_;
                  _loc5_.newName = _loc6_;
                  _1567(new CommandNotification(CommandNotification.RENAME_LIBRARY_ASSETS,_loc5_));
               }
               else if(_loc4_ is _737)
               {
                  (_loc5_ = {}).subTexture = true;
                  _loc13_ = (_loc4_ as _737).parent;
                  tempArr = _loc4_._2682.split("@");
                  if(tempArr.length == 2 && Boolean(_loc13_))
                  {
                     _loc5_._10573 = tempArr[0];
                     _loc5_._2952 = _loc4_.name;
                     _loc5_.newPath = tempArr[0];
                     _loc5_.newName = _loc1_;
                     _loc5_._10567 = _loc13_.path;
                  }
                  _1567(new CommandNotification(CommandNotification.RENAME_LIBRARY_ASSETS,_loc5_));
               }
            }
            renameDialog.close();
         };
         if(!treeNode)
         {
            return;
         }
         curName = treeNode.name;
         normalizeName = true;
         isFolderName = false;
         isSubTexture = false;
         isVitualFolderName = false;
         namePrefix = "";
         _5851 = FileUtil.escapeUrl(this._3678._3811._2682);
         if(treeNode is _694)
         {
            normalizeName = true;
         }
         else if(treeNode is _13549)
         {
            isVitualFolderName = true;
         }
         else if(treeNode is _691)
         {
            _4204 = (treeNode as _691)._4204;
            if(_4204 is _731 || _4204 is _738)
            {
               normalizeName = false;
               tempArr = curName.split("/");
               if(tempArr.length > 1)
               {
                  curName = tempArr[tempArr.length - 1];
                  tempArr.pop();
                  namePrefix = tempArr.join("/");
               }
            }
            else if(_4204 is _728)
            {
               isFolderName = true;
               folderPath = FileUtil.escapeUrl(_4204._2682);
               namePrefix = folderPath.substr(_5851.length);
               tempLen = namePrefix.length - treeNode.name.length;
               if(tempLen > 0)
               {
                  namePrefix = namePrefix.substr(0,tempLen);
               }
               else
               {
                  namePrefix = "";
               }
            }
            else if(_4204 is _737)
            {
               isSubTexture = true;
            }
         }
         renameDialog = new _174();
         renameDialog.title = tr("RenameWindow.title");
         renameDialog._2653 = tr("RenameWindow.newName");
         renameDialog.value = curName;
         renameDialog._2651 = function(param1:String):String
         {
            var _loc2_:RegExp = null;
            if(param1.length >= 20)
            {
               renameDialog.value = param1.substr(0,20);
               return tr("Rename.toolang");
            }
            if(isSubTexture)
            {
               _loc2_ = /[:*?"'<>|. @#$%^&!~]+/g;
               if(param1.match(_loc2_).length > 0)
               {
                  return tr("Rename.illegal.fileName");
               }
            }
            else if(isVitualFolderName)
            {
               if(_124._10558(param1))
               {
                  return tr("Rename.illegal.fileName");
               }
               param1 = _124._2392(param1);
            }
            else if(normalizeName)
            {
               if(_124.vertifyFileName(param1))
               {
                  return tr("Rename.illegal.fileName");
               }
               param1 = _124._2392(param1);
            }
            else if(isFolderName)
            {
               if(_124._10558(param1))
               {
                  return tr("Rename.illegal.fileName");
               }
               param1 = _124._2392(param1);
            }
            else
            {
               if(_124.vertifyFileName(param1))
               {
                  return tr("Rename.illegal.fileName");
               }
               param1 = _124._3256(param1);
            }
            if(!param1)
            {
               return "";
            }
            if(param1 == curName)
            {
               return tr("RenameWindow.error.same");
            }
            return checkSameName(param1);
         };
         renameDialog.addEventListener(Event.CLOSE,onRenameClose);
         renameDialog.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         renameDialog.open();
         if(renameDialog.closeButton)
         {
            renameDialog.closeButton.visible = false;
         }
         if(renameDialog._2631)
         {
            renameDialog._2631.visible = false;
         }
         if(renameDialog._2630)
         {
            renameDialog._2630.visible = false;
         }
      }
      
      public function saveLastSelectArmature() : void
      {
         if(Boolean(this.libraryPanel) && Boolean(this.libraryPanel.tree))
         {
            this._11618 = this.libraryPanel.tree._2484;
         }
      }
      
      public function refreshSelectedArmature() : void
      {
         var _loc1_:_1042 = null;
         var _loc2_:int = 0;
         if(this._11618 && this.libraryPanel && Boolean(this.libraryPanel.tree))
         {
            _loc1_ = this.libraryPanel.tree.dataProvider as _1042;
            if(_loc1_)
            {
               _loc2_ = _loc1_.getItemIndex(this._11618);
               if(_loc2_ >= 0)
               {
                  this.libraryPanel.tree.selectedIndex = _loc2_;
               }
            }
            this._11618 = null;
         }
      }
      
      private function newSymbolBtn_onClick(param1:MouseEvent) : void
      {
         _11110.instance._11320._11130(_11108.PanelToolBar);
         this.showNewSymbolWindow();
      }
      
      private function showNewSymbolWindow() : void
      {
         this.newSymbolWindowController._3155(this._3678._3680());
      }
      
      private function addEmptyArmatureVO(param1:String, param2:String, param3:SymbolType, param4:int = 800, param5:int = 600, param6:uint = 16777215) : void
      {
         var _loc7_:_50 = _50._1782(param1,param3);
         if(param3 == SymbolType.STAGE)
         {
            _2214._1844._2871._3286._3285(_loc7_,_763._1572(param4,param5,param6));
         }
         var _loc8_:_52 = _52._1729("root",null);
         _loc7_._1794(_loc8_);
         _loc7_._1968();
         var _loc9_:_71 = _2214._1844._2871.dragonBonesVO;
         var _loc10_:Object = _469._3490(_loc9_,_loc7_,this._4158._2871._2865,param2);
         _1567(new CommandNotification(CommandNotification.ADD_ARMATURE,_loc10_));
      }
      
      private function onDeleteArmature(param1:PanelNotification) : void
      {
         var deleteArmature:Boolean = false;
         var onCloseBtnClick:Function = null;
         var checkFunction:Function = null;
         var e:PanelNotification = param1;
         onCloseBtnClick = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.FIRST_BUTTON)
            {
               if(deleteArmature)
               {
                  removeSelectArmatureVO();
               }
               else
               {
                  removeAssets();
               }
            }
         };
         checkFunction = function(param1:DBModelEvent):void
         {
            _2216.deleteConfirm = !param1.data;
         };
         if(!this.checkDeleteArmature())
         {
            return;
         }
         deleteArmature = false;
         if(this.libraryPanel.tree._2889.length == 1 && this.libraryPanel.tree._2484 is _694)
         {
            deleteArmature = true;
         }
         _133.show(deleteArmature ? tr("RemoveWindow.content") : tr("RemoveWindow.noUndo"),tr("RemoveWindow.title"),null,onCloseBtnClick,tr("Alert.Confirm"),tr("Alert.Cancel"),"",_2216.deleteConfirm,checkFunction);
      }
      
      public function getImportAssetEnable() : Boolean
      {
         var _loc1_:_50 = null;
         var _loc2_:_50 = null;
         if(this.libraryPanel.tree._2889.length <= 1)
         {
            if(this.libraryPanel.tree._2484 is _694)
            {
               _loc1_ = (this.libraryPanel.tree._2484 as _694)._4161._1886;
            }
            else if(this.libraryPanel.tree._2484 is _693)
            {
               return true;
            }
         }
         if(_loc1_)
         {
            _loc2_ = _2214._1844._2871._2865;
            if(_loc2_ == _loc1_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function checkDeleteArmature() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.libraryPanel.tree._2889.length);
         while(_loc1_ < _loc2_)
         {
            if(this._10479(this.libraryPanel.tree._2889[_loc1_] as _691))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function getRenameAssetEnable() : Boolean
      {
         var _loc1_:_704 = null;
         if(this.libraryPanel.tree._2889.length == 1)
         {
            _loc1_ = this.libraryPanel.tree._2484;
            return this.isRenameEnable(_loc1_);
         }
         return true;
      }
      
      private function isRenameEnable(param1:_704) : Boolean
      {
         var _loc2_:_725 = null;
         var _loc3_:_738 = null;
         if(param1)
         {
            if(param1 is _694 || param1 is _13549)
            {
               return true;
            }
            _loc2_ = (param1 as _691)._4204;
            if(_loc2_ is _731 || _loc2_ is _728 || _loc2_ is _738 || _loc2_ is _14085)
            {
               return true;
            }
            if(_loc2_ is _737)
            {
               _loc3_ = (_loc2_ as _737).parent;
               if(Boolean(_loc3_) && FileUtil.getExtension(_loc3_._2682) == "json")
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function checkDeleteVitualFolder() : Boolean
      {
         var selectFolderModel:_13549;
         var canDelete:Boolean;
         var totalSelectArmatureNum:int = 0;
         var result:Boolean = false;
         var dbVO:_71 = null;
         var isDeleteAble:Function = function(param1:Array):Boolean
         {
            var _loc2_:_704 = null;
            var _loc5_:_13549 = null;
            var _loc6_:_694 = null;
            var _loc7_:_50 = null;
            var _loc8_:String = null;
            var _loc3_:int = 0;
            var _loc4_:int = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_ = param1[_loc3_];
               if(_loc2_ is _13549)
               {
                  _loc5_ = _loc2_ as _13549;
                  result = isDeleteAble(_loc5_.children);
               }
               else if(_loc2_ is _694)
               {
                  ++totalSelectArmatureNum;
                  _loc6_ = _loc2_ as _694;
                  if(_loc6_._4161)
                  {
                     _loc7_ = _loc6_._4161._1886;
                  }
                  if(!_loc7_)
                  {
                     result = false;
                  }
                  _loc8_ = _3678._4138(_loc7_.name);
                  if(!_loc8_)
                  {
                     result = false;
                  }
               }
               _loc3_++;
            }
            return result;
         };
         if(!this.libraryPanel.tree || !this.libraryPanel.tree._2889 || this.libraryPanel.tree._2889.length != 1)
         {
            return false;
         }
         if(!(this.libraryPanel.tree._2889[0] is _13549))
         {
            return false;
         }
         selectFolderModel = this.libraryPanel.tree._2889[0] as _13549;
         result = true;
         canDelete = isDeleteAble(selectFolderModel.children);
         if(!canDelete)
         {
            return false;
         }
         if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
         {
            dbVO = _2214._1844._2871.dragonBonesVO;
            if(dbVO._2126.length <= totalSelectArmatureNum)
            {
               return false;
            }
         }
         return true;
      }
      
      private function _10479(param1:_691) : Boolean
      {
         var _loc2_:_50 = null;
         var _loc3_:_71 = null;
         var _loc4_:_50 = null;
         var _loc5_:String = null;
         var _loc6_:_725 = null;
         if(param1 == null || param1 is _695)
         {
            return false;
         }
         if(param1 is _694)
         {
            if((param1 as _694)._4161)
            {
               _loc2_ = (param1 as _694)._4161._1886;
            }
            if(_loc2_ && this.libraryPanel && this.libraryPanel.tree && this.libraryPanel.tree._2889 && this.libraryPanel.tree._2889.length == 1)
            {
               if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
               {
                  _loc3_ = _2214._1844._2871.dragonBonesVO;
                  _loc4_ = _2214._1844._2871._2865;
                  _loc5_ = this._3678._4138(_loc2_.name);
                  if((Boolean(_loc5_)) && _loc3_._2126.length > 1)
                  {
                     return true;
                  }
               }
            }
         }
         else
         {
            _loc6_ = param1._4204;
            if(_loc6_ is _731 || _loc6_ is _729 || _loc6_ is _14084 || _loc6_ is _14086)
            {
               return true;
            }
         }
         return false;
      }
      
      private function removeAssets() : void
      {
         var _loc2_:int = 0;
         var _loc4_:Vector.<String> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         var _loc3_:Vector.<String> = new Vector.<String>();
         _loc1_ = 0;
         _loc2_ = int(this.libraryPanel.tree._2889.length);
         while(_loc1_ < _loc2_)
         {
            _loc4_ = this.getAssetUrl(this.libraryPanel.tree._2889[_loc1_] as _691);
            if(_loc4_)
            {
               _loc5_ = 0;
               _loc6_ = int(_loc4_.length);
               while(_loc5_ < _loc6_)
               {
                  _loc3_.push(_loc4_[_loc5_]);
                  _loc5_++;
               }
            }
            _loc1_++;
         }
         if(_loc3_.length > 0)
         {
            _1567(new CommandNotification(CommandNotification.DELETE_LIBRARY_ASSETS,_loc3_));
         }
      }
      
      private function getAssetUrl(param1:_691) : Vector.<String>
      {
         if(Boolean(param1) && Boolean(param1._4204))
         {
            return param1._4204._10584();
         }
         return null;
      }
      
      private function removeSelectArmatureVO() : void
      {
         var _loc1_:_50 = null;
         if(this.libraryPanel.tree._2889.length == 1 && this.libraryPanel.tree._2484 is _694)
         {
            _loc1_ = (this.libraryPanel.tree._2484 as _694)._4161._1886;
         }
         this.deleteArmatureVO(_loc1_);
      }
      
      private function deleteArmatureVO(param1:_50) : void
      {
         var _loc2_:_71 = null;
         var _loc3_:_50 = null;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         if(param1)
         {
            _loc2_ = _2214._1844._2871.dragonBonesVO;
            _loc3_ = _2214._1844._2871._2865;
            _loc4_ = this._3678._4138(param1.name);
            if((Boolean(_loc4_)) && _loc2_._2126.length > 1)
            {
               _loc5_ = _469._3487(_loc2_,param1,_loc3_,_loc4_);
               _1567(new CommandNotification(CommandNotification.DELETE_ARMATURE,_loc5_));
            }
            this._4171();
         }
      }
      
      private function onRightDeleteVitualFolder(param1:MenuNotification) : void
      {
         var children:Array;
         var dbVO:_71;
         var _2870:_50;
         var _11129:Object;
         var deleteVitaulfolderVO:_13550 = null;
         var deleteVitualVOList:Array = null;
         var deleteArmatureVOList:Array = null;
         var e:MenuNotification = param1;
         var createVOList:Function = function(param1:Array):void
         {
            var _loc2_:_694 = null;
            var _loc3_:_13549 = null;
            var _loc4_:int = 0;
            while(_loc4_ < param1.length)
            {
               if(param1[_loc4_] is _13549)
               {
                  _loc3_ = param1[_loc4_] as _13549;
                  deleteVitualVOList.push(_loc3_.vo);
                  createVOList(_loc3_.children);
               }
               else if(param1[_loc4_] is _694)
               {
                  _loc2_ = param1[_loc4_] as _694;
                  deleteArmatureVOList.push(_loc2_.vo._1886);
               }
               _loc4_++;
            }
         };
         if(this.libraryPanel.tree._2889.length == 1 && this.libraryPanel.tree._2484 is _13549)
         {
            deleteVitaulfolderVO = (this.libraryPanel.tree._2484 as _13549).vo as _13550;
         }
         if(!deleteVitaulfolderVO)
         {
            return;
         }
         deleteVitualVOList = [deleteVitaulfolderVO];
         deleteArmatureVOList = [];
         children = (this.libraryPanel.tree._2484 as _13549).children;
         createVOList(children);
         dbVO = _2214._1844._2871.dragonBonesVO;
         _2870 = _2214._1844._2871._2865;
         _11129 = _469._13767(dbVO,deleteArmatureVOList,deleteVitualVOList,_2870);
         _1567(new CommandNotification(CommandNotification.DELETE_VITUALFOLDER,_11129));
      }
      
      private function _4124(param1:ListEvent) : void
      {
         var _loc2_:_691 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:DisplayObject = null;
         var _loc6_:Object = null;
         var _loc7_:Point = new Point();
         if(!(param1.item is _693) && param1.item is _691)
         {
            _loc2_ = param1.item as _691;
            _loc5_ = param1.itemRenderer as DisplayObject;
            _loc6_ = {
               "_2104":_loc2_._4204,
               "render":_loc5_
            };
            _1567(new TipNotification(TipNotification.SHOW_TIP_IMAGE,_loc6_));
         }
      }
      
      private function _4125(param1:ListEvent) : void
      {
         _1567(new TipNotification(TipNotification.HIDE_TIP_IMAGE));
      }
      
      private function tree_onDoubleClick(param1:ListEvent) : void
      {
         var _loc2_:_694 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.item is _694)
         {
            param1.stopPropagation();
            _loc2_ = param1.item as _694;
            _loc3_ = 0;
            _loc4_ = int(this._4158._2871.dragonBonesVO._2126.length);
            while(_loc3_ < _loc4_)
            {
               if(this._4158._2871.dragonBonesVO._2126[_loc3_].name == _loc2_.name)
               {
                  this.openNewArmature(this._4158._2871.dragonBonesVO._2126[_loc3_]);
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      public function openNewArmature(param1:_50) : void
      {
         var _loc2_:Object = {};
         _loc2_.curArmature = param1;
         _loc2_.oldArmature = this._4158._2871._2865;
         _1567(new CommandNotification(CommandNotification.SET_CURRENT_ARMATURE,_loc2_));
      }
      
      private function _9808(param1:NativeDragEvent) : void
      {
         var _loc2_:Clipboard = null;
         var _loc3_:Object = null;
         var _loc4_:File = null;
         if(this._4186 != 1)
         {
            this._4186 = 1;
            _loc2_ = param1.clipboard;
            if(_loc2_.hasFormat(ClipboardFormats.FILE_LIST_FORMAT))
            {
               _loc3_ = _loc2_.getData(ClipboardFormats.FILE_LIST_FORMAT);
               if(!this.isValidDragIn(_loc3_))
               {
                  return;
               }
               _14259.isExportData = false;
               for each(_loc4_ in _loc3_)
               {
                  if(_loc4_ && !_loc4_.isDirectory)
                  {
                     if(this.isSupportDragIn(_loc4_.extension) && !this.hasFile(_loc4_.nativePath))
                     {
                        NativeDragManager.dropAction = NativeDragActions.COPY;
                        NativeDragManager.acceptDragDrop(this.libraryPanel);
                     }
                  }
               }
            }
            return;
         }
      }
      
      public function _4532(param1:NativeDragEvent, param2:Function = null) : void
      {
         var _loc3_:Clipboard = null;
         this.stageDragCallBack = param2;
         _11110.instance._11620._11130(_11108.Drag);
         _11110.instance._11620._11132();
         this._4186 = 0;
         _loc3_ = param1.clipboard;
         var _loc4_:Object = _loc3_.getData(ClipboardFormats.FILE_LIST_FORMAT);
         this.saveFilesToLibrarySafely(_loc4_);
      }
      
      private function _4531(param1:NativeDragEvent) : void
      {
         this._4186 = 0;
      }
      
      private function isValidDragIn(param1:Object) : Boolean
      {
         var _loc3_:File = null;
         var _loc2_:int = 0;
         for each(_loc3_ in param1)
         {
            if(Boolean(_loc3_) && (_loc3_.extension != "psd" && _loc3_.size > MAX_FILE_SIZE))
            {
               return false;
            }
            _loc2_++;
         }
         if(_loc2_ > MAX_FILE_NUM)
         {
            return false;
         }
         return true;
      }
      
      public function saveFilesToLibrarySafely(param1:Object, param2:Function = null) : Boolean
      {
         var o:Object = null;
         var data:Object = param1;
         var callback:Function = param2;
         if(this.existFiles(data))
         {
            o = {};
            o.message = tr("Import.warn.overwrite");
            o.confirmLabel = tr("Import.overwrite.yes");
            o.cancelLabel = tr("Import.overwrite.no");
            o.confirm = function():void
            {
               _3676(data,true);
               _4188();
               if(callback != null)
               {
                  callback();
               }
            };
            o.cancel = function():void
            {
               _3676(data,false);
               _4188();
               if(callback != null)
               {
                  callback();
               }
            };
            _1567(new TipNotification(TipNotification.TIP_CONFIRM,o));
         }
         else
         {
            this._3676(data,false);
            this._4188();
            if(callback != null)
            {
               callback();
            }
         }
         return true;
      }
      
      private function _3676(param1:Object, param2:Boolean) : Boolean
      {
         var _loc3_:File = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_.extension == "psd")
            {
               this.savePSDToLibrary(_loc3_);
            }
            else if(_loc3_ && !this.hasFile(_loc3_.nativePath) && _loc3_.size <= MAX_FILE_SIZE)
            {
               this.saveToLibrary(_loc3_,param2);
            }
         }
         return true;
      }
      
      private function savePSDToLibrary(param1:File) : void
      {
         var name:String = null;
         var o:Object = null;
         var file:File = param1;
         var armatureType:SymbolType = _2214._1844._2871._2865._1811;
         switch(armatureType)
         {
            case SymbolType.COMIC:
               return;
            case SymbolType.MC:
            case SymbolType.SHEET:
               this.isCreateSkeleton = true;
               break;
            case SymbolType.ARMATURE:
            case SymbolType.STAGE:
               this.isCreateSkeleton = false;
               break;
            default:
               this.isCreateSkeleton = false;
         }
         name = file.name.substring(0,file.name.indexOf("."));
         if(this.checkDirectoryName(name))
         {
            o = {};
            o.message = tr("Import.warn.overwrite");
            o.firstLabel = tr("Import.overwrite.yes");
            o.secondLabel = tr("Import.overwrite.no");
            o.threeLabel = tr("Import.psdexport.cancel");
            o.firstFun = function():void
            {
               parsePSDData(file,name,true);
               _4188();
            };
            o.secondFun = function():void
            {
               parsePSDData(file,name,false);
               _4188();
            };
            _1567(new TipNotification(TipNotification.TIP_THREE_BTN,o));
         }
         else
         {
            this.parsePSDData(file,name,false);
         }
      }
      
      private function parsePSDData(param1:File, param2:String, param3:Boolean) : void
      {
         var _14550:Function = null;
         var alert:_14119 = null;
         var file:File = param1;
         var name:String = param2;
         var overwrite:Boolean = param3;
         _14550 = function():void
         {
            var _2952:String;
            var path:String;
            var _3249:String;
            var fileBytes:ByteArray;
            var _12727:Object;
            if(file.isDirectory)
            {
               return;
            }
            _14546 = false;
            _2952 = name;
            path = FileUtil.escapePath(_3678._3680() + "/" + name);
            if(!overwrite)
            {
               name = _124._1747(name,checkDirectoryName);
               path = FileUtil.escapePath(_3678._3680() + "/" + name);
            }
            _3249 = "Armature" + _2952;
            if(_14259.isCreateSkeleton)
            {
               _353.type = _353.TYPE_RENAME;
               _3249 = _124._1747(_3249,_3244);
            }
            else
            {
               _353.type = _353.TYPE_REPLACE;
               _3249 = _2214._1844._2871._2865.name;
            }
            _14554 = null;
            _14554 = new _14120(file.size > MAX_FILE_SIZE);
            _14554._14459 = cancelExport;
            _14554._14326 = [path];
            _14554.open();
            _14554.msg = tr("Import.psdexport.tipMsg0");
            fileBytes = FileUtil.openAsByteArray(file.nativePath);
            fileBytes.shareable = true;
            fileBytes.position = 0;
            fileBytes.compress();
            _12727 = new Object();
            _12727["originType"] = _14259.originType;
            _12727["scale"] = _14259.scale;
            _12727["ignoreHiddenLayers"] = _14259.ignoreHiddenLayers;
            _12727["onlyUpdateTexture"] = _14259.onlyUpdateTexture;
            _12727["isExportData"] = _14259.isExportData;
            _12727["bytes"] = fileBytes;
            _12727["outpath"] = path;
            _12727["newArmatureName"] = _3249;
            _12727["name"] = name;
            _12727["overwrite"] = overwrite;
            try
            {
               psdParseContorler._14471(_12727,_14479,_14482);
            }
            catch(e:Error)
            {
               Alert.show(tr("Import.psdexport.errorTip"));
            }
         };
         if(_14259.isExportData)
         {
            alert = new _14119();
            alert._14550 = _14550;
            alert.open();
            alert.reset();
            alert._14539 = this.isCreateSkeleton;
         }
         else
         {
            _14550();
         }
      }
      
      private function _14482(param1:String) : void
      {
         var tip:String = param1;
         _14037.register(Context.getInstance().stage);
         _14037._14323(24,function():void
         {
            Alert.show(tip);
            cancelExport("");
         });
      }
      
      private function _14479(param1:String, param2:Boolean) : void
      {
         var display:Array = null;
         var data:Object = null;
         var layers:Array = null;
         var totalNum:int = 0;
         var curNum:int = 0;
         var imgInfo:Object = null;
         var saveSuccess:Function = null;
         var saveFail:Function = null;
         var path:String = param1;
         var overwrite:Boolean = param2;
         saveSuccess = function():void
         {
            var _loc1_:_627 = null;
            var _loc2_:_606 = null;
            if(_14546)
            {
               return;
            }
            layers[curNum] = null;
            ++curNum;
            _14554.msg = tr("Import.psdexport.tipMsg2",curNum,totalNum);
            if(curNum == totalNum)
            {
               if(Boolean(data.hasOwnProperty("dataStatus")) && data["dataStatus"] == "none")
               {
                  _4188();
                  _14554.close();
                  _14037._14321();
                  return;
               }
               _14037._14323(3,_14554.close);
               if(_14259.isCreateSkeleton)
               {
                  _14554.msg = tr("Import.psdexport.tipMsg4");
                  _loc1_ = _1407.getInstance(_627);
                  _14037._14323(2,_loc1_._14551,data,path,_3678._3680());
               }
               else
               {
                  _14554.msg = tr("Import.psdexport.tipMsg3");
                  _loc2_ = _1407.getInstance(_606);
                  _14037._14323(2,_loc2_._14541,display);
               }
               _14037.dispose();
               psdParseContorler.clear();
            }
            else
            {
               if(curNum == totalNum - 2)
               {
                  _14554.enabled = false;
               }
               imgInfo = layers[curNum];
               _118.save(imgInfo["pngPath"],imgInfo["pngBytes"],true,"",false,saveSuccess,saveFail);
            }
            _14037._14323(1,_4188);
         };
         saveFail = function():void
         {
            --totalNum;
         };
         this.psdParseContorler._14472();
         _14037.register(Context.getInstance().stage);
         display = this.psdParseContorler.display;
         data = this.psdParseContorler.jsonData;
         this._14554.msg = tr("Import.psdexport.tipMsg1");
         layers = this.psdParseContorler.layers;
         totalNum = int(layers.length);
         curNum = 0;
         imgInfo = layers[curNum];
         _118.save(imgInfo["pngPath"],imgInfo["pngBytes"],true,"",false,saveSuccess,saveFail);
      }
      
      private function cancelExport(param1:String) : void
      {
         this._14546 = true;
         this.psdParseContorler._14472();
         this._14554.close();
         _14037._14321();
         if(!param1)
         {
            return;
         }
         var _loc2_:File = File.applicationDirectory.resolvePath(param1);
         if(_loc2_.exists)
         {
            _loc2_.deleteDirectory(true);
         }
      }
      
      private function _3244(param1:String) : Boolean
      {
         var _loc2_:_71 = _2214._1844._2871.dragonBonesVO;
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc2_._2126.length);
         while(_loc3_ < _loc4_)
         {
            if(_loc2_._2126[_loc3_].name == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      private function checkDirectoryName(param1:String) : Boolean
      {
         var _loc2_:String = FileUtil.escapePath(this._3678._3680() + "/" + param1);
         var _loc3_:File = File.applicationDirectory.resolvePath(_loc2_);
         if(_loc3_.exists)
         {
            return true;
         }
         return false;
      }
      
      private function _3256(param1:String, param2:String) : Boolean
      {
         var _loc3_:String = FileUtil.escapePath(this._3678._3680() + "/" + param1 + "." + param2);
         var _loc4_:File = File.applicationDirectory.resolvePath(_loc3_);
         if(_loc4_.exists)
         {
            return true;
         }
         return false;
      }
      
      private function existFiles(param1:Object) : Boolean
      {
         var _loc2_:File = null;
         for each(_loc2_ in param1)
         {
            if(Boolean(_loc2_) && !this.hasFile(_loc2_.nativePath))
            {
               if(this.existFile(_loc2_))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function validFiles(param1:Object) : Boolean
      {
         var _loc2_:File = null;
         for each(_loc2_ in param1)
         {
            if(Boolean(_loc2_) && !this.hasFile(_loc2_.nativePath))
            {
               return true;
            }
         }
         return false;
      }
      
      private function isSupportDragIn(param1:String) : Boolean
      {
         switch(param1.toLowerCase())
         {
            case "png":
            case "xml":
            case "json":
            case "psd":
            case "svg":
            case "swf":
               return true;
            default:
               return false;
         }
      }
      
      private function onOpen(param1:Event) : void
      {
         var _loc2_:File = null;
         try
         {
            _loc2_ = new File(this._3678._3680());
            if(Boolean(_loc2_.exists) && Boolean(_loc2_.isDirectory))
            {
               _loc2_.openWithDefaultApplication();
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function onChangeLibraryPath(param1:Event) : void
      {
         var _loc2_:String = FileUtil.escapeUrl(this._3678._3680());
         var _loc3_:String = FileUtil.escapeUrl(File.applicationStorageDirectory.resolvePath("newProjectTemp").nativePath);
         if(_loc2_.indexOf(_loc3_) != -1)
         {
            Alert.show(tr("SaveProject.tip"));
            return;
         }
         FileUtil.browseForOpen(this._4159,3,null,tr("BasePage.SelectProjectPath"),this._3678._3680());
      }
      
      private function _3306(param1:Event) : void
      {
         _11110.instance._11620._11130(_11108.Panel);
         this.openImportAssetsDialog();
      }
      
      private function openImportAssetsDialog() : void
      {
         FileUtil.browseForOpen(this.importFiles,2,_650._4167,tr("BasePage.SelectProjectPath"));
      }
      
      private function importFiles(param1:Array) : void
      {
         var f:File = null;
         var libraryFile:File = null;
         var files:Array = param1;
         try
         {
            _14259.isExportData = false;
            this.saveFilesToLibrarySafely(files,this.selectLastNode);
            _11110.instance._11620._11132();
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("LibraryPanelController::importFiles",e);
         }
      }
      
      private function selectLastNode() : void
      {
         var _loc3_:_702 = null;
         var _loc4_:String = null;
         if(!this.lastPath)
         {
            return;
         }
         var _loc1_:Array = this._4158._4149._4162._3678.children;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            if(_loc3_ is _691)
            {
               _loc4_ = (_loc3_ as _691)._4204._2682;
               if(_loc4_ == this.lastPath && Boolean(this._14553))
               {
                  this._14553.tree._2484 = _loc3_;
                  this._14553._14538(_loc3_);
                  this._14553.tree._2449();
                  this._14553.tree._4550(_loc3_);
                  this.lastPath = "";
                  break;
               }
            }
            _loc2_++;
         }
      }
      
      public function importImagesToLibrary() : void
      {
         this.openImportAssetsDialog();
      }
      
      public function _13239() : void
      {
         FileUtil.browseForOpen(this.importImagesFiles,2,_650._4169,tr("BasePage.ImportAsset"));
      }
      
      private function importImagesFiles(param1:Array) : void
      {
         var f:File = null;
         var libraryFile:File = null;
         var files:Array = param1;
         try
         {
            _14259.isExportData = true;
            this.saveFilesToLibrarySafely(files,function():void
            {
               var _loc4_:String = null;
               var _loc5_:_725 = null;
               var _loc1_:int = 0;
               var _loc2_:int = int(files.length);
               var _loc3_:Vector.<_725> = new Vector.<_725>();
               _loc1_ = 0;
               while(_loc1_ < _loc2_)
               {
                  _loc4_ = FileUtil.getFileName((files[_loc1_] as File).nativePath);
                  _loc5_ = _2106._3806(_loc4_);
                  if(_loc5_)
                  {
                     _loc3_.push(_loc5_);
                  }
                  _loc1_++;
               }
               addAssetsToStage(_loc3_,true);
               _11110.instance._11619._11132();
            });
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("LibraryPanelController::importImagesFiles",e);
         }
      }
      
      public function importSequenceImagesToStage() : void
      {
         FileUtil.browseForOpen(this.importSequenceImagesFiles,2,_650._4169,tr("BasePage.ImportAsset"));
      }
      
      private function importSequenceImagesFiles(param1:Array) : void
      {
         var f:File = null;
         var libraryFile:File = null;
         var files:Array = param1;
         try
         {
            this.saveFilesToLibrarySafely(files,function():void
            {
               var _loc4_:String = null;
               var _loc5_:_725 = null;
               var _loc1_:int = 0;
               var _loc2_:int = int(files.length);
               var _loc3_:Vector.<_725> = new Vector.<_725>();
               _loc1_ = 0;
               while(_loc1_ < _loc2_)
               {
                  _loc4_ = FileUtil.getFileName((files[_loc1_] as File).nativePath);
                  _loc5_ = _2106._3806(_loc4_);
                  if(_loc5_)
                  {
                     _loc3_.push(_loc5_);
                  }
                  _loc1_++;
               }
               addSequenceAssetsToStage(_loc3_);
            });
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("LibraryPanelController::importSequenceImagesFiles",e);
         }
      }
      
      private function addAssetsToStage(param1:Vector.<_725>, param2:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_50 = null;
         var _loc8_:Object = null;
         var _loc9_:_725 = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Rectangle = null;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
         {
            _loc7_ = _2214._1844._2871._2865;
            if(!_loc7_)
            {
               return;
            }
            if(_loc7_._1811 == SymbolType.MC || _loc7_._1811 == SymbolType.STAGE)
            {
               _loc5_ = 0;
               _loc6_ = int(param1.length);
               while(_loc5_ < _loc6_)
               {
                  _loc3_.push(param1[_loc5_]);
                  _loc4_.push(new Point());
                  _loc5_++;
               }
            }
            else
            {
               _loc5_ = 0;
               _loc6_ = int(param1.length);
               while(_loc5_ < _loc6_)
               {
                  _loc3_.push(_70._2090(param1[_loc5_]));
                  _loc4_.push(new Point());
                  _loc5_++;
               }
            }
         }
         if(param2)
         {
            _loc8_ = {};
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc9_ = param1[_loc5_];
               _loc10_ = _loc9_.width;
               _loc11_ = _loc9_.height;
               if(isNaN(_loc10_))
               {
                  _loc10_ = 0;
               }
               if(isNaN(_loc11_))
               {
                  _loc11_ = 0;
               }
               _loc8_[_loc9_.name] = new Rectangle(0,0,_loc10_,_loc11_);
               _loc5_++;
            }
            _loc12_ = _212._2830(0,10,10,_loc8_,false,false);
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc4_[_loc5_].x = _loc8_[param1[_loc5_].name].x + param1[_loc5_].width / 2 - _loc12_.width / 2;
               _loc4_[_loc5_].y = _loc8_[param1[_loc5_].name].y + param1[_loc5_].height / 2 - _loc12_.height / 2;
               _loc5_++;
            }
         }
         _1567(new StageNotification(StageNotification.ADD_ASSETS_TO_STAGE,{
            "_13225":_loc3_,
            "positionList":_loc4_
         }));
      }
      
      private function addSequenceAssetsToStage(param1:Vector.<_725>) : void
      {
         _1567(new StageNotification(StageNotification.ADD_SEQUENCE_ASSETS_TO_STAGE,param1));
      }
      
      private function _4195(param1:Event) : void
      {
         this._4188();
      }
      
      private function _4172(param1:Event) : void
      {
         if(this._4158._2871)
         {
            this._4188();
         }
      }
      
      public function existFile(param1:File) : Boolean
      {
         var _loc2_:String = this._3678._3680() + "/" + param1.name;
         return FileUtil.exists(_loc2_);
      }
      
      private function existFileName(param1:String) : Boolean
      {
         var _loc2_:String = this._3678._3680() + "/" + param1;
         return FileUtil.exists(_loc2_);
      }
      
      public function saveToLibrary(param1:File, param2:Boolean = true, param3:String = null) : void
      {
         var extension:String;
         var name:String;
         var path:String;
         var newFile:File;
         var file:File = param1;
         var overwrite:Boolean = param2;
         var newName:String = param3;
         if(file.isDirectory)
         {
            return;
         }
         extension = file.extension.toLowerCase();
         name = file.name.substring(0,file.name.indexOf("."));
         if(!overwrite && !newName)
         {
            name = _124._14327(name,extension,this._3256);
            newName = name + "." + extension;
         }
         path = FileUtil.escapePath(this._3678._3680() + "/" + (newName == null ? file.name : newName));
         newFile = file.resolvePath(path);
         try
         {
            file.copyTo(newFile,overwrite);
            if(this.stageDragCallBack != null && extension != "swf")
            {
               this._4188();
               this.stageDragCallBack.call(null,name);
               this.stageDragCallBack = null;
            }
            this.lastPath = FileUtil.escapePath(path);
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("LibraryPanelController::saveToLibrary",e);
         }
      }
      
      protected function tree_onItemMouseDown(param1:ListEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(param1.item is _693)
         {
            return;
         }
         this._4163 = param1.itemRenderer as TreeItemRenderer;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4157);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._4126);
         this.moveCount = 0;
      }
      
      protected function _4157(param1:MouseEvent) : void
      {
         ++this.moveCount;
         if(this.moveCount > 1)
         {
            this.stopTrackMouse();
            this.doDrag();
         }
      }
      
      protected function _4126(param1:MouseEvent) : void
      {
         this.stopTrackMouse();
      }
      
      protected function stopTrackMouse() : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4157);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._4126);
      }
      
      protected function doDrag() : void
      {
         var _loc4_:_691 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:_725 = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Rectangle = null;
         var _loc13_:_861 = null;
         var _loc14_:_862 = null;
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Vector.<_862> = new Vector.<_862>();
         var _loc3_:Vector.<_861> = new Vector.<_861>();
         if(this._4192 == null)
         {
            this._4192 = new Vector.<_691>();
         }
         this._4192.length = 0;
         if(this.tree._2889.length > 1)
         {
            _loc6_ = 0;
            _loc7_ = int(this.tree._2889.length);
            while(_loc6_ < _loc7_)
            {
               _loc4_ = this.tree._2889[_loc6_] as _691;
               if((_loc4_) && !(_loc4_ is _693) && !(_loc4_ is _694))
               {
                  this._4192.push(_loc4_);
               }
               _loc6_++;
            }
         }
         else if(this.tree._2889.length == 1)
         {
            _loc4_ = this.tree._2889[0] as _691;
            if((Boolean(_loc4_)) && !(_loc4_ is _693))
            {
               this._4192.push(_loc4_);
            }
         }
         _loc7_ = int(this._4192.length);
         if(_loc7_ == 0)
         {
            return;
         }
         if(_loc7_ > 0)
         {
            _loc8_ = {};
            _loc6_ = 0;
            while(_loc6_ < _loc7_)
            {
               _loc9_ = this._4192[_loc6_]._4204;
               _loc10_ = _loc9_.width;
               _loc11_ = _loc9_.height;
               if(isNaN(_loc10_))
               {
                  _loc10_ = 0;
               }
               if(isNaN(_loc11_))
               {
                  _loc11_ = 0;
               }
               _loc8_[_loc9_.name] = new Rectangle(0,0,_loc10_,_loc11_);
               _loc6_++;
            }
            _loc12_ = _212._2830(0,10,10,_loc8_,false,false);
         }
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            if(this._4192[_loc6_] is _694)
            {
               (_loc13_ = new _861())._2104 = this._4192[_loc6_]._4204;
               _loc13_.x = _loc8_[_loc13_._2104.name].x;
               _loc13_.y = _loc8_[_loc13_._2104.name].y;
               _loc1_.addChild(_loc13_);
               _loc3_.push(_loc13_);
            }
            else
            {
               (_loc14_ = new _862())._2104 = this._4192[_loc6_]._4204;
               _loc14_.x = _loc8_[_loc14_._2104.name].x - _loc12_.width / 2;
               _loc14_.y = _loc8_[_loc14_._2104.name].y - _loc12_.height / 2;
               _loc1_.addChild(_loc14_);
               _loc2_.push(_loc14_);
            }
            _loc6_++;
         }
         var _loc5_:_1111 = new _1111();
         if(_loc3_.length > 0)
         {
            _loc5_.addData(_loc3_,DBDragFormat.ARMATURE);
         }
         else
         {
            _loc5_.addData(_loc2_,DBDragFormat.IMAGE);
         }
         DragManager.doDrag(this._4163,_loc5_,_loc1_,-this._4163.mouseX,-this._4163.mouseY);
         _1567(new PanelNotification(PanelNotification.LIBRARYTREE_START_DRAG));
         stage.addEventListener(MouseEvent.MOUSE_UP,this.this_onStopDrag);
      }
      
      protected function this_onStopDrag(param1:MouseEvent) : void
      {
         _1567(new PanelNotification(PanelNotification.LIBRARYTREE_STOP_DRAG));
      }
      
      public function hasFile(param1:String) : Boolean
      {
         if(Boolean(this._2106) && Boolean(this._2106._3814))
         {
            return this._2106._3814._4185(param1);
         }
         return false;
      }
      
      public function _4188() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:_696 = this._4158._4149;
         _loc1_ = _loc2_._4188();
         if(_loc1_)
         {
            if(this._4158 && this._4158._2871 && Boolean(this._4158._2871._2865))
            {
               this._2106._3278(this._4158._2871._2865);
            }
            this._4141();
            this._2891();
            _1567(new StageNotification(StageNotification.UPDATE_LIBRARY));
         }
         var _loc3_:String = _loc2_._4160();
         if(_loc3_)
         {
            _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
               "showText":tr("Tip.library.nameConflict",_loc3_),
               "type":_717.ANIMATE
            }));
         }
      }
      
      private function checkMissing() : void
      {
         var _loc2_:_79 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:_50 = _2214._1844._2871._2865;
         if(_loc1_)
         {
            _loc3_ = 0;
            _loc4_ = int(_loc1_._1780.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_ = _loc1_._1780[_loc3_] as _79;
               if(_loc2_._2049 && _loc2_._2049._2104 && _loc2_._2049._2104.missing)
               {
                  this._2106._3817(_loc2_._2049);
               }
               _loc3_++;
            }
         }
      }
      
      public function refreshItemNum(param1:Boolean = true) : void
      {
         this._4141();
         this._2891();
      }
      
      public function _2891(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         if(param1 && this.libraryPanel && this.libraryPanel.tree && Boolean(this.libraryPanel.tree._2490))
         {
            _loc2_ = this.libraryPanel.tree._2490.verticalScrollPosition;
         }
         this._4158._3997.refresh();
         if(param1 && this.libraryPanel && this.libraryPanel.tree && Boolean(this.libraryPanel.tree._2490))
         {
            this.libraryPanel.tree._2449();
            this.libraryPanel.tree._2490.verticalScrollPosition = _loc2_;
         }
      }
      
      public function _2950(param1:String, param2:String) : void
      {
         this._4158._2871.libraryData._2950(param1,param2);
         this._4158._4149._2950(param1,param2);
         this._2891();
         this.updateChildArmature(param1,param2);
      }
      
      public function renameVitualFolder(param1:String, param2:String) : void
      {
         this._2891();
      }
      
      private function updateChildArmature(param1:String, param2:String) : void
      {
         var _loc4_:_50 = null;
         var _loc5_:_79 = null;
         var _loc6_:_69 = null;
         var _loc7_:_70 = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc3_:_71 = _2214._1844._2871.dragonBonesVO;
         var _loc8_:int = 0;
         var _loc9_:int = int(_loc3_._2126.length);
         while(_loc8_ < _loc9_)
         {
            _loc4_ = _loc3_._2126[_loc8_];
            _loc10_ = 0;
            _loc11_ = int(_loc4_._1780.length);
            while(_loc10_ < _loc11_)
            {
               _loc5_ = _loc4_._1780[_loc10_];
               _loc12_ = 0;
               _loc13_ = int(_loc5_._1715.length);
               while(_loc12_ < _loc13_)
               {
                  _loc6_ = _loc5_._1715[_loc12_] as _69;
                  if(_loc6_)
                  {
                     _loc7_ = _loc5_._1765[_loc6_] as _70;
                     if((Boolean(_loc7_)) && _loc7_.type == _74.ARMATURE)
                     {
                        if(_loc7_.path == param1)
                        {
                           _loc7_.changePath(param2);
                        }
                     }
                  }
                  _loc12_++;
               }
               _loc10_++;
            }
            _loc8_++;
         }
      }
      
      public function renameAssetName(param1:String, param2:String) : void
      {
         var _loc4_:_50 = null;
         var _loc5_:_79 = null;
         var _loc6_:_69 = null;
         var _loc7_:_70 = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc3_:_71 = _2214._1844._2871.dragonBonesVO;
         var _loc8_:int = 0;
         var _loc9_:int = int(_loc3_._2126.length);
         while(_loc8_ < _loc9_)
         {
            _loc4_ = _loc3_._2126[_loc8_];
            _loc10_ = 0;
            _loc11_ = int(_loc4_._1780.length);
            while(_loc10_ < _loc11_)
            {
               _loc5_ = _loc4_._1780[_loc10_];
               _loc12_ = 0;
               _loc13_ = int(_loc5_._1715.length);
               while(_loc12_ < _loc13_)
               {
                  _loc6_ = _loc5_._1715[_loc12_] as _69;
                  if(_loc6_)
                  {
                     _loc7_ = _loc5_._1765[_loc6_] as _70;
                     if((Boolean(_loc7_)) && _loc7_.type != _74.ARMATURE)
                     {
                        if(_loc7_.path == param1)
                        {
                           _loc7_.changePath(param2);
                        }
                     }
                  }
                  _loc12_++;
               }
               _loc10_++;
            }
            _loc8_++;
         }
      }
      
      public function renameAssetFolderName(param1:String, param2:String) : void
      {
         var _loc4_:_50 = null;
         var _loc5_:_79 = null;
         var _loc6_:_69 = null;
         var _loc7_:_70 = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc3_:_71 = _2214._1844._2871.dragonBonesVO;
         var _loc8_:int = 0;
         var _loc9_:int = int(_loc3_._2126.length);
         while(_loc8_ < _loc9_)
         {
            _loc4_ = _loc3_._2126[_loc8_];
            _loc10_ = 0;
            _loc11_ = int(_loc4_._1780.length);
            while(_loc10_ < _loc11_)
            {
               _loc5_ = _loc4_._1780[_loc10_];
               _loc12_ = 0;
               _loc13_ = int(_loc5_._1715.length);
               while(_loc12_ < _loc13_)
               {
                  _loc6_ = _loc5_._1715[_loc12_] as _69;
                  if(_loc6_)
                  {
                     _loc7_ = _loc5_._1765[_loc6_] as _70;
                     if((Boolean(_loc7_)) && _loc7_.type != _74.ARMATURE)
                     {
                        if(_loc7_.path.indexOf(param1) == 0)
                        {
                           _loc14_ = _loc7_.path.replace(param1,param2);
                           _loc7_.changePath(_loc14_);
                        }
                     }
                  }
                  _loc12_++;
               }
               _loc10_++;
            }
            _loc8_++;
         }
      }
      
      private function _4159(param1:File) : void
      {
         if(this._3678._3680() == param1.nativePath)
         {
            return;
         }
         this._3678._4159(param1.nativePath);
         var _loc2_:_696 = this._4158._4149;
         _loc2_._4188();
         this._2106._3278(this._4158._2871._2865);
         this._4141();
         _1567(new StageNotification(StageNotification.UPDATE_LIBRARY));
         this._2891(false);
         this._4158._2871._4189();
      }
      
      public function set _2871(param1:_665) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_50 = null;
         if(this._4158._2871 == param1)
         {
            return;
         }
         _14077.instance.clear();
         this._4158._2871 = param1;
         if(param1)
         {
            this.libraryPanel._4158 = this._4158;
            this.libraryPanel.tree._2484 = this._3678._4162;
            this._4188();
            _loc2_ = 0;
            _loc3_ = int(param1.dragonBonesVO._2126.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc4_ = param1.dragonBonesVO._2126[_loc2_];
               this._2106._3278(_loc4_);
               _loc2_++;
            }
            _1567(new StageNotification(StageNotification.UPDATE_LIBRARY));
            this._4141();
            this._4171();
         }
      }
      
      public function createVitualFolder() : void
      {
         var _loc1_:String = _124._1747("NewFolder",this.checkNewVitualFolderName);
         var _loc2_:_13550 = new _13550(_loc1_);
         _loc2_._13695 = this._3678._5841;
         _loc2_._13751 = _13550.LIBRARYPROJECTDATA;
         var _loc3_:Object = _469._13768(_loc2_);
         _1567(new CommandNotification(CommandNotification.ADD_VITUAL_FOLDER,_loc3_));
      }
      
      public function addVitualFolderVO(param1:_13550) : void
      {
         this._4158._13790(param1);
      }
      
      public function _13735(param1:_13550) : void
      {
         this._4158._13735(param1);
      }
      
      private function checkNewVitualFolderName(param1:String) : Boolean
      {
         var _loc2_:Array = this._4158._2871.libraryData._13788;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_].name == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function _2867(param1:_50, param2:String) : void
      {
         this._4158._2867(param1,param2);
         this.checkDisplayVO(param1);
      }
      
      public function addArmatureVOByPanretVO(param1:_50, param2:String, param3:Object) : void
      {
         this._4158._13787(param1,param2,param3);
         this.checkDisplayVO(param1);
      }
      
      private function checkDisplayVO(param1:_50) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._1780.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = param1._1780[_loc3_];
            if(_loc2_._2049 != null)
            {
               if(_loc2_._2049._2104 == null || _loc2_._2049._2104.missing)
               {
                  this._2106._3808(param1.name,_loc2_._2049);
               }
            }
            _loc3_++;
         }
      }
      
      public function _2863(param1:String) : void
      {
         this._4158._2863(param1);
      }
      
      public function replaceArmatureVO(param1:_50, param2:String) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:_50 = null;
         if(this._4158._2871._2865.name == param1.name)
         {
            _loc3_ = true;
         }
         this._2863(param1.name);
         this._2867(param1,param2);
         if(_loc3_)
         {
            this._4158._2871._2865 = param1;
            this._4158._4147(param1.name);
            _1567(new StageNotification(StageNotification.UPDATE_CURRENT_ARMATURE));
            if(param1._1811 == SymbolType.ARMATURE)
            {
               _2220._2873 = _715.ARMATURE;
            }
            else if(param1._1811 == SymbolType.MC)
            {
               _2220._2873 = _715.GENERAL;
            }
         }
         else
         {
            _loc4_ = this._4158._2871._2865;
            this._2106._3278(_loc4_);
            _1567(new StageNotification(StageNotification.UPDATE_LIBRARY));
         }
      }
      
      public function _4152(param1:DisplayObject) : Boolean
      {
         if(this.libraryPanel && param1 && this.libraryPanel.contains(param1))
         {
            return true;
         }
         return false;
      }
      
      public function importArmatures(param1:Vector.<_50>, param2:Vector.<String>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Object = {};
         var _loc6_:Vector.<_50> = new Vector.<_50>();
         var _loc7_:Vector.<_50> = new Vector.<_50>();
         var _loc8_:Vector.<String> = new Vector.<String>();
         var _loc9_:_71 = _2214._1844._2871.dragonBonesVO;
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(_loc9_._2129(param1[_loc3_].name))
            {
               _loc6_.push(_loc9_._2107(param1[_loc3_].name));
               _loc8_.push(this._3678._4138(param1[_loc3_].name));
            }
            else
            {
               _loc7_.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         _loc5_._10296 = param1;
         _loc5_._10294 = param2;
         _loc5_._10299 = _loc6_;
         _loc5_._10297 = _loc7_;
         _loc5_._10298 = _loc8_;
         _loc5_.dragonBonesVO = _loc9_;
         _1567(new CommandNotification(CommandNotification.IMPORT_ARMATUERS,_loc5_));
      }
      
      public function getSelectedArmatures() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         if(this.tree._2889)
         {
            _loc2_ = 0;
            _loc3_ = int(this.tree._2889.length);
            while(_loc2_ < _loc3_)
            {
               if(this.tree._2889[_loc2_] is _694)
               {
                  _loc1_.push((this.tree._2889[_loc2_] as _694)._4161._1886.name);
               }
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      public function duplicateArmature(param1:_50) : void
      {
         if(this._3678 == null || param1 == null)
         {
            return;
         }
         var _loc2_:String = this._3678._4138(param1.name);
         var _loc3_:_71 = new _71();
         var _loc4_:String = _2214._1844._2871.dragonBonesVO.version;
         _loc3_.version = _loc4_;
         _loc3_.name = "duplicate_db";
         _loc3_._2126 = new Vector.<_50>();
         _loc3_._2128(param1);
         var _loc5_:Object = _13488._13605(_loc3_,_loc4_,true);
         var _loc6_:_71 = _13488._1757(_loc5_,{},true,true);
         var _loc7_:_50 = _loc6_._2126[0];
         var _loc8_:String = _124._1747(_loc7_.name,this._3248);
         _loc7_.name = _loc8_;
         this._2106._3278(param1);
         var _loc9_:Vector.<_50> = new Vector.<_50>();
         var _loc10_:Vector.<String> = new Vector.<String>();
         _loc9_.push(_loc7_);
         _loc10_.push(_loc2_);
         this.importArmatures(_loc9_,_loc10_);
      }
      
      private function _3248(param1:String) : Boolean
      {
         var _loc2_:_71 = _2214._1844._2871.dragonBonesVO;
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc2_._2126.length);
         while(_loc3_ < _loc4_)
         {
            if(_loc2_._2126[_loc3_].name == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function _4417(param1:_50) : void
      {
         var _loc2_:_694 = null;
         if(this._3678)
         {
            _loc2_ = this._3678._13274(param1,this._3678.children);
            if(_loc2_)
            {
               if(Boolean(this.libraryPanel) && Boolean(this.tree))
               {
                  this.tree._2484 = _loc2_;
               }
            }
         }
      }
      
      public function selectCurArmature() : void
      {
         if(_3028)
         {
            this._4417(_3028);
         }
      }
      
      private function get tree() : _163
      {
         return this.libraryPanel.tree;
      }
      
      public function get _3678() : _696
      {
         return this._4158._4149;
      }
      
      public function get _2106() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      private function get newSymbolWindowController() : _630
      {
         return _1407.getInstance(_630) as _630;
      }
      
      private function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
      
      private function get psdParseContorler() : _14071
      {
         return _1407.getInstance(_14071);
      }
   }
}

