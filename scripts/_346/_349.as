package _346
{
   import _1404._1407;
   import _477.ExportEgretController;
   import _579._580;
   import _721._720;
   import _93._92;
   import _953._960;
   import _97._117;
   import _97._118;
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   
   public class _349 extends _92
   {
      private var projectPath:String;
      
      private var i:int = 1;
      
      private var _3239:int = 2;
      
      private var _3237:int = 0;
      
      public function _349()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.projectPath = this.ouputPath;
         this._2372();
      }
      
      private function _2372() : void
      {
         var _loc1_:File = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Array = ["comic/index.html","comic/main.min.js","comic/libs/qrcode.js","comic/libs/modules/egret/egret.min.js","comic/libs/modules/egret/egret.web.min.js","comic/libs/modules/game/game.min.js","comic/libs/modules/game/game.web.min.js","comic/libs/modules/res/res.min.js","comic/libs/modules/tween/tween.min.js","comic/resource/arrow.json","comic/resource/arrowtexture.json"];
         var _loc6_:File = new File(this.projectPath);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc1_ = File.applicationDirectory.resolvePath("egretlauncher/" + _loc5_[_loc7_]);
            if(!_loc1_.exists)
            {
               _loc1_ = File.applicationDirectory;
               _loc1_ = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath));
               _loc1_ = _loc1_.resolvePath("doc").resolvePath("egretlauncher/" + _loc5_[_loc7_]);
            }
            _loc2_ = _loc1_.nativePath;
            _loc3_ = FileUtil.openAsString(_loc2_);
            _loc4_ = _loc6_.resolvePath(_loc5_[_loc7_]).nativePath;
            FileUtil.save(_loc4_,_loc3_);
            _loc7_++;
         }
         var _loc8_:String = "comic/resource/arrowtexture.png";
         _loc1_ = File.applicationDirectory.resolvePath("egretlauncher/" + _loc8_);
         if(!_loc1_.exists)
         {
            _loc1_ = File.applicationDirectory;
            _loc1_ = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath));
            _loc1_ = _loc1_.resolvePath("doc").resolvePath("egretlauncher/" + _loc8_);
         }
         _loc2_ = _loc1_.nativePath;
         _loc4_ = _loc6_.resolvePath(_loc8_).nativePath;
         FileUtil.copyTo(_loc2_,_loc4_,true);
         this._3232();
      }
      
      private function _3232() : void
      {
         var _loc1_:_960 = this._3176.stagePanel.stageView;
         var _loc2_:File = File.applicationDirectory.resolvePath("egretlauncher/comic/index.html");
         if(!_loc2_.exists)
         {
            _loc2_ = File.applicationDirectory;
            _loc2_ = new File(FileUtil.getDirectory(_loc2_.nativePath));
            _loc2_ = _loc2_.resolvePath("doc").resolvePath("egretlauncher/comic/index.html");
         }
         var _loc3_:String = FileUtil.openAsString(_loc2_.nativePath);
         _loc3_ = _loc3_.split("width: 1200px;height: 900px").join("width:100%;height:100%" + ";background:#" + _117._2375);
         _loc3_ = _loc3_.split("data-content-width=\"1200\"").join("data-content-width=\"" + _loc1_._3233 + "\"");
         _loc3_ = _loc3_.split("data-content-height=\"900\"").join("data-content-height=\"" + _loc1_._3231 + "\"");
         _loc3_ = _loc3_.split("data-frame-rate=\"30\"").join("data-frame-rate=\"" + 24 + "\"");
         var _loc4_:File = new File(this.projectPath);
         _118.save(_loc4_.resolvePath("comic/index.html").nativePath,_loc3_,true,"",false,this._2378,this._2379);
      }
      
      private function _2378() : void
      {
         this._3228._3230(this._3238,this.exportData);
      }
      
      private function exportData(param1:String, param2:Array) : void
      {
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:Object = null;
         this.i = 0;
         this._3239 = 2;
         var _loc3_:File = new File(this.projectPath);
         var _loc4_:int = 0;
         _118.save(_loc3_.resolvePath("comic/resource/skeleton.json").nativePath,param1,true,"",false,this.run,this._2379);
         var _loc5_:Object = new Object();
         var _loc6_:* = "";
         _loc5_.resources = [];
         _loc5_.groups = [];
         var _loc7_:Object;
         (_loc7_ = new Object()).name = "skeleton_json";
         _loc7_.type = "json";
         _loc7_.url = "skeleton.json";
         _loc6_ += _loc7_.name;
         _loc5_.resources.push(_loc7_);
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            this._3239 += 2;
            _loc12_ = param2[_loc4_];
            _118.save(_loc3_.resolvePath("comic/resource/texture_" + _loc4_ + ".png").nativePath,_loc12_._1854,true,"",false,this.run,this._2379);
            _118.save(_loc3_.resolvePath("comic/resource/texture_" + _loc4_ + ".json").nativePath,_loc12_.textureConfig,true,"",false,this.run,this._2379);
            (_loc13_ = new Object()).name = "texture_json" + _loc4_;
            _loc13_.type = "json";
            _loc13_.url = "texture_" + _loc4_ + ".json";
            _loc6_ += "," + _loc13_.name;
            _loc5_.resources.push(_loc13_);
            (_loc14_ = new Object()).name = "texture_png" + _loc4_;
            _loc14_.type = "image";
            _loc14_.url = "texture_" + _loc4_ + ".png";
            _loc6_ += "," + _loc14_.name;
            _loc5_.resources.push(_loc14_);
            _loc4_++;
         }
         var _loc8_:Object = {
            "url":"arrow.json",
            "type":"json",
            "name":"arrow_json"
         };
         var _loc9_:Object = {
            "url":"arrowtexture.json",
            "type":"json",
            "name":"arrowtexture_json"
         };
         var _loc10_:Object = {
            "url":"arrowtexture.png",
            "type":"image",
            "name":"arrowtexture_png"
         };
         _loc5_.resources.push(_loc8_);
         _loc5_.resources.push(_loc9_);
         _loc5_.resources.push(_loc10_);
         _loc6_ += ",arrow_json,arrowtexture_json,arrowtexture_png";
         var _loc11_:Object;
         (_loc11_ = new Object()).name = "TestArmature";
         _loc11_.keys = _loc6_;
         _loc5_.groups.push(_loc11_);
         _118.save(_loc3_.resolvePath("comic/resource/resource.json").nativePath,JSON.stringify(_loc5_),true,"",false,this.run,this._2379);
      }
      
      private function run() : void
      {
         ++this.i;
         if(this.i == this._3239)
         {
            this._3235();
         }
      }
      
      private function _3235() : void
      {
         this._3228._3229(this.ouputPath + "comic");
      }
      
      private function _2379() : void
      {
         _117._2377("ExportEgret, Export file error");
      }
      
      private function get ouputPath() : String
      {
         return _2223._3238.ouputPath as String;
      }
      
      private function get _3238() : _720
      {
         return _2223._3238 as _720;
      }
      
      private function get _3228() : ExportEgretController
      {
         return _1407.getInstance(ExportEgretController) as ExportEgretController;
      }
      
      public function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
   }
}

