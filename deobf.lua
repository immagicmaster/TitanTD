local v0, v1, items, callback_fn, v2, v3, http_service, items_2, callback_fn_2, v4, v5, items_3, v6, items_4, items_5, items_6, v7, v8, v9, v10, items_7, items_8, v11, v12, v13, v14, v15, v16, v17, callback_fn_3, callback_fn_4, v18, items_9, v19, callback_fn_5, callback_fn_6, v20, items_10, v21, v22, items_11, v23, v24, v25, v26, http_service_ref, callback_fn_ref, callback_fn_2_ref, v5_ref, v27, v2_ref, items_ref, items_2_ref, v3_ref, v9_ref, items_6_ref, items_5_ref, v7_ref, items_7_ref, items_8_ref, v11_ref, callback_fn_7, items_4_ref, v14_ref, v28, callback_fn_5_ref, callback_fn_3_ref, v29, v30, callback_fn_8, v31, callback_fn_9, egg_collector_running, v21_ref, v18_ref, flag, callback_fn_4_ref, unpack_fn;
local floor_fn = math.floor;
local random_fn = math.random;
local remove_fn = table.remove;
local char_fn = string.char;
local n1 = 0;
local items_12 = {};
local n2 = 1;
local n3 = 2;
local items_12_ref = items_12;
local lookup = {};
for i = 1, 256, 1 do
	lookup[i] = i;
end;
local v32 = #lookup;
local v33 = #lookup == 0;
repeat
	v33 = random_fn(1, #lookup);
	v32 = remove_fn(lookup, v33);
	n2 = char_fn(v32 - 1);
	items_12_ref[v32] = n2;
until #lookup == 0;
v33 = {};
local message = "__metatable";
local message_2 = "__index";
v32 = v33;
local callback_fn_10 = function(arg1, arg2, arg3, arg4)
		local v0;
		if #0 == 0 then
			n1 = (n1 * 25 + 19062568116907) % 35184372088832;
			repeat
 
			until false;
			v0 = floor_fn(n1 / 2 ^ (13 - (n3 - n3 % 32) / 32));
			floor_fn((((v0 % 4294967296) / 2 ^ (n3 % 32)) % 1) * 4294967296);
			floor_fn((v0 % 4294967296) / 2 ^ (n3 % 32));
		end;
		return table.remove(v32);
	end;
local v34 = nil;
local callback_fn_10_ref = callback_fn_10;
lookup = nil;
local items_13 = {};
callback_fn_10 = {};
n2 = callback_fn_10;
local callback_fn_10_ref_2 = callback_fn_10;
local items_14 = { __index = callback_fn_10, __metatable = nil };
local v35 = setmetatable(items_13, items_14);
callback_fn_10 = function(arg1, arg2)
		local v0, items_12_ref_ref, n1, v1, v2;
		local n2_ref = n2;
		if n2[arg2] then
 
		else
			items_12_ref_ref = items_12_ref;
			v0 = string.len(arg1);
			n2_ref[arg2] = "";
			n1 = 164;
			for i = 1, v0.len(arg1), 1 do
				v2 = string.byte(arg1, i);
				v1 = callback_fn_10_ref();
				n1 = ((v2 + v1) + n1) % 256;
				n2_ref[arg2] = n2_ref[arg2] .. items_12_ref_ref[((v2 + v1) + ((v2 + v1) + ((v2 + v1) + ((v2 + v1) + ((v2 + v1) + n1) % 256) % 256) % 256) % 256) % 256 + 1];
			end;
		end;
		return arg2;
	end;
local v35_ref = v35;
local callback_fn_10_ref_3 = callback_fn_10;
floor_fn = game:GetService("Players");
random_fn = floor_fn.LocalPlayer;
char_fn = nil;
local message_3 = "https://raw.githubusercontent.com/immagicmaster/TitanTD/refs/heads/main/AllowedList.lua";
items_12 = function()
		local v0;
		local items = { game:HttpGet(message_3) };
		v0();
		return;
	end;
items_12_ref = { pcall(items_12) };
local v36 = items_12_ref[2];
n3 = not items_12_ref[1];
if not items_12_ref[1] then
	v32 = tostring(v36);
	warn("[WHITELIST ERROR] Failed to load: " .. v32);
	random_fn.Kick(random_fn, "Failed to connect to server.");
	return;
else
	items_12 = v0;
	lookup = char_fn;
	items_12_ref = not char_fn;
	n3 = not char_fn;
	if not (not char_fn) then
		type(char_fn);
	end;
	if n3 then
		warn("[WHITELIST ERROR] Invalid whitelist format");
		random_fn.Kick(random_fn, "Invalid server response.");
		return;
	else
		items_12_ref = char_fn;
		items_13 = "\007\197.G";
		v32 = v35_ref;
		items_14 = 23453289917097;
		callback_fn_10 = callback_fn_10_ref_3;
		n2 = 23453289917097;
		callback_fn_10_ref = "Name";
		lookup = random_fn.Name;
		items_12 = char_fn[random_fn.Name];
		n3 = not char_fn[random_fn.Name];
		if not char_fn[random_fn.Name] then
			random_fn.Kick(random_fn, "You are not whitelisted.");
			return;
		else
			local unpack_fn = unpack_fn;
			print("[WHITELIST] \226\156\147 " .. (random_fn.Name .. " authenticated successfully"));
			items_12 = game:GetService("Players");
			items_12_ref = items_12.LocalPlayer;
			lookup = items_12.LocalPlayer:WaitForChild("PlayerGui");
			n3 = lookup;
			print("[NOAH HUB] \240\159\154\128 Starting Noah Hub...");
			callback_fn_10_ref = getgenv();
			items_14 = getgenv();
			callback_fn_10_ref.MainTabConfig = items_14.MainTabConfig;
			callback_fn_10_ref = getgenv();
			items_14 = getgenv();
			callback_fn_10_ref.AntiBanConfig = items_14.AntiBanConfig;
			callback_fn_10_ref = getgenv();
			items_14 = getgenv();
			callback_fn_10_ref.AutoFarmConfig = items_14.AutoFarmConfig;
			callback_fn_10_ref = getgenv();
			items_14 = getgenv();
			callback_fn_10_ref.PerformanceConfig = items_14.PerformanceConfig;
			callback_fn_10_ref = function(arg1, arg2, arg3, arg4)
					local v0 = getgenv();
					local performance_config = v0.PerformanceConfig;
					local message = "BlackScreenGui";
					if v0.PerformanceConfig.BlackScreenGui then
						return;
					else
						message = function(arg1, arg2)
								local v0;
								v0[v0[4720922790038]] = v0;
								v0[v0[19581661012894]] = v0;
								v0[v0[17139388014381]] = v0;
								v0[v0[17826771050605]] = v0;
								v0[v0[4697488099467]] = v0;
								v0[v0[5805169609359]] = v0;
								local v1 = v0(1, 0, 1, 0);
								v0[v0[28863693173888]] = v1;
								v1 = v0(0, 0, 0, 0);
								v0[v0[17943498432675]] = v1;
								v1 = v0(0, 0, 0);
								v0[v0[9801149878740]] = v1;
								v0[v0[22270625327234]] = v0;
								v0[v0[3791808268005]] = v0;
								v0[v0[14068893784471]] = v0;
								v0[v0[30929895618626]] = v0;
								v0[v0[11958031734208]] = v0;
								v1 = v0();
								v1[v0][v0] = v0;
								return;
							end;
						performance_config = pcall(message);
						if not performance_config then
							warn("[BLACK SCREEN] Failed to create");
						end;
						return;
					end;
				end;
			v12 = callback_fn_10_ref;
			v32 = function(arg1, arg2)
					local v0 = getgenv();
					local message = "BlackScreenGui";
					if v0.PerformanceConfig.BlackScreenGui then
						message = function(arg1, arg2, arg3, arg4)
								local v0;
								getgenv();
								local v1 = v0();
								v1[v0][v0] = nil;
								return;
							end;
						pcall(message);
					end;
					return;
				end;
			callback_fn_10_ref = v32;
			callback_fn_10 = getgenv();
			callback_fn_10_ref_2 = getgenv();
			callback_fn_10.LowGraphicsConfig = callback_fn_10_ref_2.LowGraphicsConfig;
			callback_fn_10 = function(arg1, arg2, arg3, arg4, arg5)
					local env = getfenv and getfenv() or _ENV;
					local lighting = game:GetService("Lighting");
					local lighting_ref = lighting;
					lighting = game:GetService("Workspace");
					local terrain_instance = lighting:FindFirstChildOfClass("Terrain");
					local v0 = settings();
					local quality_level = v0.Rendering.QualityLevel;
					local v1 = tostring(v0.Rendering.QualityLevel);
					print("[LOW GRAPHICS] \240\159\147\138 Current Quality Level: " .. v1);
					v0 = getgenv();
					local v2 = terrain_instance or 1;
					r1 = terrain_instance or .3;
					r33 = terrain_instance or .15;
					local terrain_instance_ref = terrain_instance;
					terrain_instance = v0.LowGraphicsConfig;
					local n1 = 21131697514096;
					r77 = {};
					v0 = {
							Brightness = lighting_ref.Brightness,
							GlobalShadows = lighting_ref.GlobalShadows,
							Technology = lighting_ref.Technology,
							WaterReflectance = v2,
							WaterTransparency = r1,
							WaterWaveSize = r33,
							WaterWaveSpeed = terrain_instance_ref or 10,
							RenderDistance = quality_level,
							PostEffects = r77,
						};
					terrain_instance.OriginalSettings = v0;
					r7 = getgenv();
					r51 = r7.LowGraphicsConfig.OriginalSettings;
					r1 = 5451766974954;
					r35 = tostring(r7.LowGraphicsConfig.OriginalSettings.RenderDistance);
					print("[LOW GRAPHICS] \226\156\147 Saved Quality Level: " .. r35);
					lighting = pairs;
					v1 = { lighting_ref:GetChildren() };
					for key, value in pairs((unpack or table.unpack)(v1)) do
						r1 = 5451766974954;
						r51 = value:IsA("RenderDistance");
						lighting = r51;
						if not r51 then
							r1 = v35_ref;
							("\127\214=\137\138r\249hf)\019|\172\170")(5823312530071, 12597889177322);
							v35_ref(value, callback_fn_10_ref_3);
							if not v35_ref then
								(5823312530071)("(\2510", "PostEffects");
								r1 = value:IsA("\127\214=\137\138r\249hf)\019|\172\170");
								if not r1 then
									(5823312530071)("K\'\241\008\232\215", "PostEffects");
									value.IsA(value, "\127\214=\137\138r\249hf)\019|\172\170");
								end;
							end;
						end;
						if lighting then
							local env = env;
							v35_ref[26198882561959](callback_fn_10_ref_3, 26198882561959);
							n1 = 11361526191274;
							v35_ref("\169}3\215", "\127\214=\137\138r\249hf)\019|\172\170");
							callback_fn_10_ref_3(5451766974954, 5823312530071);
							callback_fn_10_ref_3(5451766974954, 5823312530071);
							v35_ref[11361526191274](callback_fn_10_ref_3, 11361526191274);
							(5823312530071)(value, 12597889177322);
							if 5823312530071 then
								v35_ref[27289322598819](callback_fn_10_ref_3, 27289322598819);
							end;
							v35_ref("\202\198Y|\2473\221+\207i\216\215\238tY\233^q\236\022\191", "\127\214=\137\138r\249hf)\019|\172\170");
							lighting = value:IsA(v35_ref["\202\198Y|\2473\221+\207i\216\215\238tY\233^q\236\022\191"][callback_fn_10_ref_3]);
							if lighting then
								v35_ref[13506326321297](callback_fn_10_ref_3, 13506326321297);
								value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
								v35_ref[15774763949233](callback_fn_10_ref_3, 15774763949233);
								value.RenderDistance[v35_ref[27381762716110]][v35_ref[v35_ref]] = value.RenderDistance;
								v35_ref[27381762716110](callback_fn_10_ref_3, 27381762716110);
								value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
								v35_ref[2153202779114](callback_fn_10_ref_3, 2153202779114);
								value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
							else
								v35_ref("\134u\220\n^\175};\014\021\197", "\127\214=\137\138r\249hf)\019|\172\170");
								lighting = value:IsA(v35_ref["\134u\220\n^\175};\014\021\197"][callback_fn_10_ref_3]);
								if lighting then
									v35_ref[22532624902396](callback_fn_10_ref_3, 22532624902396);
									value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
									v35_ref[1982286562203](callback_fn_10_ref_3, 1982286562203);
									value.RenderDistance[v35_ref[14640325892769]][v35_ref[v35_ref]] = value.RenderDistance;
									v35_ref[14640325892769](callback_fn_10_ref_3, 14640325892769);
									value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
								else
									v35_ref("l\2292s\028; \156\"i\237\132\024", "\127\214=\137\138r\249hf)\019|\172\170");
									lighting = value:IsA(v35_ref["l\2292s\028; \156\"i\237\132\024"][callback_fn_10_ref_3]);
									if lighting then
										v35_ref[20909111289352](callback_fn_10_ref_3, 20909111289352);
										value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
										v35_ref[32698361265018](callback_fn_10_ref_3, 32698361265018);
										value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
									else
										v35_ref("\221\1452\183\215\026\021\163\1490", "\127\214=\137\138r\249hf)\019|\172\170");
										lighting = value:IsA(v35_ref["\221\1452\183\215\026\021\163\1490"][callback_fn_10_ref_3]);
										if lighting then
											v35_ref[5855687756454](callback_fn_10_ref_3, 5855687756454);
											value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
										else
											v35_ref("O\143\187.\132{\228\131\249@", "\127\214=\137\138r\249hf)\019|\172\170");
											lighting = value:IsA(v35_ref["O\143\187.\132{\228\131\249@"][callback_fn_10_ref_3]);
											if lighting then
												v35_ref[32054570318414](callback_fn_10_ref_3, 32054570318414);
												value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
												v35_ref[9225018396871](callback_fn_10_ref_3, 9225018396871);
												value[v35_ref[30888144943151]][v35_ref[30888144943151]][v35_ref[v35_ref]] = value[v35_ref[30888144943151]];
												v35_ref[30888144943151](callback_fn_10_ref_3, 30888144943151);
												value.RenderDistance[v35_ref[32633162890076]][v35_ref[v35_ref]] = value.RenderDistance;
												v35_ref[32633162890076](callback_fn_10_ref_3, 32633162890076);
												value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
												v35_ref[4038878611288](callback_fn_10_ref_3, 4038878611288);
												value[v35_ref[28653033894942]][v35_ref[28653033894942]][v35_ref[v35_ref]] = value[v35_ref[28653033894942]];
												v35_ref[28653033894942](callback_fn_10_ref_3, 28653033894942);
												value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
											else
												v35_ref("s\192\147", "\127\214=\137\138r\249hf)\019|\172\170");
												lighting = value:IsA(v35_ref["s\192\147"][callback_fn_10_ref_3]);
												if lighting then
													v35_ref[30806236674057](callback_fn_10_ref_3, 30806236674057);
													value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
													v35_ref[245897773170](callback_fn_10_ref_3, 245897773170);
													value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
													v35_ref[7699551243777](callback_fn_10_ref_3, 7699551243777);
													value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
													v35_ref[23897840692088](callback_fn_10_ref_3, 23897840692088);
													value.RenderDistance[v35_ref[22832293931400]][v35_ref[v35_ref]] = value.RenderDistance;
													v35_ref[22832293931400](callback_fn_10_ref_3, 22832293931400);
													value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
													v35_ref[8064616320683](callback_fn_10_ref_3, 8064616320683);
													value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
												else
													v35_ref("\198&\029\019\024n", "\127\214=\137\138r\249hf)\019|\172\170");
													lighting = value:IsA(v35_ref["\198&\029\019\024n"][callback_fn_10_ref_3]);
													if lighting then
														v35_ref[34425494584990](callback_fn_10_ref_3, 34425494584990);
														value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
														v35_ref[18958194254460](callback_fn_10_ref_3, 18958194254460);
														value.RenderDistance[v35_ref[21701042956153]][v35_ref[v35_ref]] = value.RenderDistance;
														v35_ref[21701042956153](callback_fn_10_ref_3, 21701042956153);
														value.RenderDistance.RenderDistance[v35_ref[v35_ref]] = value.RenderDistance;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
							env["\127\214=\137\138r\249hf)\019|\172\170"]();
							(5823312530071)("%\027\205N\003~uL4^C\206\158\149\226\160N", v35_ref[n1]);
							(5451766974954)(12597889177322, 15249606187965);
							("\127\214=\137\138r\249hf)\019|\172\170")(5823312530071, 12597889177322);
							RenderDistance.RenderDistance(v35_ref[v35_ref], RenderDistance[v35_ref[v35_ref]]);
						end;
					end;
					r7 = getgenv();
					lighting("[LOW GRAPHICS] \226\156\147 Saved " .. (#r7.LowGraphicsConfig.OriginalSettings.PostEffects .. " lighting effects"));
					return;
				end;
			v32 = callback_fn_10;
			n2 = function(arg1)
					local v0;
					local v1 = (getfenv and getfenv() or _ENV)[v0];
					local callback_fn = function()
							local unpack_fn = unpack or table.unpack;
							local n1, n2, v35_ref_ref, callback_fn_10_ref_3_ref, v35_ref_ref_2, message, n3, n4, n5, n6, n7, n8;
							local lighting = game:GetService("Lighting");
							local lighting_ref = lighting;
							lighting = game:GetService("Workspace");
							local lighting_ref_2 = lighting;
							local terrain_instance = lighting:FindFirstChildOfClass("Terrain");
							local terrain_instance_ref = terrain_instance;
							print("[LOW GRAPHICS] \240\159\142\168 Applying optimizations...");
							lighting_ref.Brightness = 2;
							lighting_ref.GlobalShadows = false;
							lighting_ref.Technology = Enum.Technology.Legacy;
							local v0 = settings();
							v0.Rendering.QualityLevel = Enum.QualityLevel.Level01;
							print("[LOW GRAPHICS] \226\156\147 Render distance set to minimum (Level 1)");
							v0 = 0;
							terrain_instance = pairs;
							local args = { lighting_ref:GetChildren() };
							for key, value in pairs((unpack or table.unpack)(args)) do
								(23350612667001)("\151H:\023\\\205qE\006\135", 9016161161318);
								terrain_instance = value:IsA("\214\204\253\248V\243\002");
								if terrain_instance then
									(552985723137)("\167\177\029\137\230Yg", 13655492237526);
									value[("\214\204\253\248V\243\002")[23350612667001]] = "\214\204\253\248V\243\002";
								else
									("\214\204\253\248V\243\002")(value, 552985723137);
									if "\214\204\253\248V\243\002" then
										(23350612667001)("\183;<c\028\006\162", 1840091300696);
										value["\214\204\253\248V\243\002"] = 552985723137;
										(23350612667001)("\176\251\165H&\007", 32613686491986);
										value["\214\204\253\248V\243\002"] = 552985723137;
									else
										(552985723137)(value, 23350612667001);
										if 552985723137 then
											value[552985723137] = 23350612667001;
											getgenv();
											getgenv();
											(552985723137)[23350612667001] = { Object = value, OriginalParent = lighting_ref };
										else
											n1 = 6021337942771;
											(23350612667001)(value, "Clouds");
											if 23350612667001 then
												value[23350612667001] = nil;
												getgenv();
												n1 = getgenv();
												(23350612667001)[#n1.LowGraphicsConfig.RemovedObjects + 1] = { Object = value, OriginalParent = lighting_ref };
											end;
										end;
									end;
								end;
							end;
							local message_2 = "\244\145\006\130\196\213\242\248!\169~15";
							local n9 = 28277660676975;
							print("[LOW GRAPHICS] \226\156\147 Disabled " .. (v0  .. " post effects"));
							if terrain_instance_ref then
								terrain_instance_ref.WaterReflectance = 0;
								terrain_instance_ref.WaterTransparency = 1;
								terrain_instance_ref.WaterWaveSize = 0;
								terrain_instance_ref.WaterWaveSpeed = 0;
								print("[LOW GRAPHICS] \226\156\147 Water effects disabled");
							end;
							local n10 = 0;
							local items = { lighting_ref_2:GetDescendants() };
							for key, value in pairs(unpack_fn(items)) do
								n2 = 16962219990746;
								message_2 = "Decal";
								n9 = value:IsA("Decal");
								if not n9 then
									value.IsA(value, "Texture");
								end;
								if lighting_ref_2.GetDescendants then
									n2 = callback_fn_10_ref_3;
									message_2 = value:FindFirstAncestorOfClass("Folder");
									if not (not message_2) then
										value.FindFirstAncestorOfClass(value, "Folder");
									end;
									if lighting_ref_2.GetDescendants then
										value[lighting_ref_2.GetDescendants] = nil;
										getgenv();
										n2 = getgenv();
										lighting_ref_2.GetDescendants[#n2.LowGraphicsConfig.RemovedObjects + 1] = { Object = value, OriginalParent = value.Parent };
									end;
								end;
							end;
							print("[LOW GRAPHICS] \226\156\147 Removed " .. (n10  .. " textures"));
							local n11 = 0;
							local items_2 = { lighting_ref_2:GetDescendants() };
							for key, value in pairs(unpack_fn(items_2)) do
								("c\193\148g1\140\214\0144")("/T\144\024u\001\244w", 11452930561237);
								lighting_ref_2.GetDescendants(value, callback_fn_10_ref_3);
								if lighting_ref_2.GetDescendants then
									("c\193\148g1\140\214\0144")(value, 16628167745087);
									(16628167745087)(value, "Folder");
									if lighting_ref_2.GetDescendants then
										if lighting_ref_2.GetDescendants then
											(16628167745087)("\0004\029\187\145n", 9752827875773);
											(16628167745087)();
											lighting_ref_2.GetDescendants(("c\193\148g1\140\214\0144")[16628167745087], "c\193\148g1\140\214\0144");
											callback_fn_10_ref_3(16628167745087, 6559148313582);
											value[lighting_ref_2.GetDescendants] = callback_fn_10_ref_3;
										end;
										if value["c\193\148g1\140\214\0144"] > 0 then
											("c\193\148g1\140\214\0144")("a\178\135\029\028\n\243QV\167\241", 12897011341173);
											value[callback_fn_10_ref_3] = 0;
										end;
									end;
								end;
							end;
							local message_3 = "\003W\234Kc\175\016\143\195\232";
							local n12 = 22096130172977;
							n2 = 22096130172977;
							print("[LOW GRAPHICS] \226\156\147 Optimized " .. (n11  .. " materials"));
							args = 0;
							n1 = "}\195\141";
							local map = lighting_ref_2:FindFirstChild("Map");
							if map then
								n1 = { map:GetDescendants() };
								for key, value in pairs(unpack_fn(n1)) do
									message = "&OG\030\167";
									n2 = terrain_instance;
									v35_ref_ref = v35_ref;
									callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
									n12 = "Model";
									message_3 = value:IsA("Model");
									if not message_3 then
										v35_ref_ref = value:IsA("Part");
										if not v35_ref_ref then
											value.IsA(value, "MeshPart");
										end;
									end;
									if map.GetDescendants then
										n3 = 14233630497252;
										n2 = map.GetDescendants:lower();
										callback_fn_10_ref_3_ref = v35_ref;
										message = 14233630497252;
										n12 = n2:find("tree");
										if not n12 then
											message = v35_ref;
											n4 = 20232152671437;
											n3 = 20232152671437;
											callback_fn_10_ref_3_ref = n2:find("plant");
											if not callback_fn_10_ref_3_ref then
												n3 = v35_ref;
												n5 = 29858032498255;
												n4 = 29858032498255;
												message = n2:find("grass");
												if not message then
													n4 = v35_ref;
													n6 = 20483781748034;
													n5 = 20483781748034;
													n3 = n2:find("bush");
													if not n3 then
														n5 = v35_ref;
														n7 = 9952050876954;
														n6 = 9952050876954;
														n4 = n2:find("flower");
														if not n4 then
															n6 = v35_ref;
															n8 = 25723155623626;
															n7 = 25723155623626;
															n5 = n2:find("rock");
															if not n5 then
																n7 = v35_ref;
																n8 = 34491049606845;
																n6 = n2:find("stone");
																if not n6 then
																	n8 = v35_ref;
																	n7 = n2:find("cloud");
																	if not n7 then
																		n8 = n2:find("decor");
																		if not n8 then
																			n2.find(n2, "prop");
																		end;
																	end;
																end;
															end;
														end;
													end;
												end;
											end;
										end;
										if map.GetDescendants then
											value[map.GetDescendants] = nil;
											getgenv();
											message = getgenv();
											map.GetDescendants[#message.LowGraphicsConfig.RemovedObjects + 1] = { Object = value, OriginalParent = value.Parent };
										end;
									end;
								end;
								if args > 0 then
									print("[LOW GRAPHICS] \226\156\147 Removed " .. (args .. " map decorations"));
								end;
							end;
							local n13 = 0;
							n2 = { lighting_ref_2:GetDescendants() };
							for key, value in pairs(unpack_fn(n2)) do
								v35_ref_ref_2 = v35_ref;
								callback_fn_10_ref_3_ref = "ParticleEmitter";
								v35_ref_ref = value:IsA("ParticleEmitter");
								if not v35_ref_ref then
									v35_ref_ref_2 = value:IsA("Trail");
									if not v35_ref_ref_2 then
										value.IsA(value, "Beam");
									end;
								end;
								if lighting_ref_2.GetDescendants then
									callback_fn_10_ref_3_ref = value:FindFirstAncestorOfClass("Folder");
									if not (not callback_fn_10_ref_3_ref) then
										value.FindFirstAncestorOfClass(value, "Folder");
									end;
									if lighting_ref_2.GetDescendants then
										value[lighting_ref_2.GetDescendants] = false;
									end;
								end;
							end;
							if n13 > 0 then
								print("[LOW GRAPHICS] \226\156\147 Disabled " .. (n13  .. " particle effects"));
							end;
							print("[LOW GRAPHICS] \226\156\133 All optimizations applied!");
							return;
						end;
					return;
				end;
			items_13 = function(arg1)
					local v0;
					local v1 = (getfenv and getfenv() or _ENV)[v0];
					return;
				end;
			v13 = n2;
			n2 = items_13;
			message_2 = function()
					local v0;
					local callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local v0;
							local v1 = getgenv();
							v0.JSONEncode(v0, { [v0] = v1.WebhookConfig.URL });
							return;
						end;
					local v1 = (getfenv and getfenv() or _ENV)[v0];
					return;
				end;
			items_14 = message_2;
			items_13 = function(arg1, arg2, arg3, arg4)
					local v0;
					local message = "NoahScriptHub/WebhookConfig.json";
					local v35_ref_ref = v35_ref;
					local message_2 = "NoahScriptHub";
					local v1 = isfolder("NoahScriptHub");
					if not v1 then
						makefolder("NoahScriptHub");
					end;
					v1 = message;
					local v2 = isfile(message);
					if v2 then
						message_2 = function()
								local unpack_fn_7 = unpack or table.unpack;
								local v0;
								local items = { readfile(message) };
								local items_2 = { v0:JSONDecode(unpack_fn_7(items)) };
								return unpack_fn_7(nil);
							end;
						v35_ref_ref = { pcall(message_2) };
						v1 = v35_ref_ref[2];
						if v35_ref_ref[1] then
							v0 = callback_fn_10_ref_3("", 20062607631486);
							print("[WEBHOOK] Loaded saved config: " .. (v1.URL ~= v35_ref[v0]));
							if not v1.URL then
								callback_fn_10_ref_3("", 21393789953770);
							end;
							return nil;
						else
							callback_fn_10_ref_3("", 4557983549514);
							return nil;
						end;
					end;
				end;
			callback_fn_10_ref_2 = getgenv();
			message_2 = "WebhookConfig";
			v1 = getgenv();
			message = v1.WebhookConfig;
			if not v1.WebhookConfig then
				items_13();
			end;
			callback_fn_10_ref_2[message_2] = message;
			message = getgenv();
			message.WebhookConfig.GamesPlayed = 0;
			print("[WEBHOOK] Games counter reset to 0");
			v34 = { game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua") };
			callback_fn_10_ref_2 = loadstring(unpack_fn(v34));
			message_2 = callback_fn_10_ref_2();
			callback_fn_10_ref_2 = message_2;
			message_2 = message_2;
			v5 = UDim2.fromOffset(580, 460);
			v2 = Vector2.new(560, 350);
			v4 = Vector2.new(850, 560);
			items_4 = { Enabled = true, Anonymous = true };
			items_9 = { "1234", "5678" };
			items_7 = { Key = items_9, SaveKey = true };
			v16 = callback_fn_10_ref_3("", 9929409892879);
			v19 = v35_ref[v16];
			v16 = UDim.new(1, 0);
			v18 = Color3.fromHex("#6A4EC1");
			items_10 = { Color3.fromHex("#150F26") };
			v22 = ColorSequence.new(v18, unpack_fn(items_10));
			items_9 = {
					Title = v19,
					CornerRadius = v16,
					StrokeThickness = 3,
					Enabled = true,
					Draggable = true,
					OnlyMobile = false,
					Color = v22,
				};
			v34 = {
					Title = "Noah Hub",
					Icon = "rbxassetid://107309769795150",
					Author = "by Threldor",
					Folder = "NoahScriptHub",
					Size = v5,
					MinSize = v2,
					MaxSize = v4,
					Transparent = true,
					Theme = "Dark",
					Resizable = true,
					SideBarWidth = 200,
					BackgroundImageTransparency = .42,
					HideSearchBar = true,
					User = items_4,
					KeySystem = items_7,
					OpenButton = items_9,
				};
			message = message_2:CreateWindow(v34);
			v34 = getgenv();
			v34.NoahHubWindow = message;
			v34 = getgenv();
			v34.NoahHubLoaded = true;
			v34 = getgenv();
			v34.WindUI = callback_fn_10_ref_2;
			message.SetToggleKey(message, Enum.KeyCode.LeftShift);
			print("[NOAH HUB] Press Left Shift to toggle UI visibility");
			print("[NOAH HUB] Script ready! Close UI with X button to unlock for re-execution");
			v34 = function(arg1, arg2, arg3)
					local callback_fn = function()
							local replicated_storage = game:GetService("ReplicatedStorage");
							local replicated_storage_ref = replicated_storage;
							local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							local find_first_child_fn = replicated_storage.FindFirstChild;
							find_first_child_fn = find_first_child_fn(replicated_storage_ref, "RemoteFunctions");
							local find_first_child_fn_ref = find_first_child_fn;
							find_first_child_fn = not find_first_child_fn;
							if not (not (not (not (not (not (not find_first_child_fn)))))) then
								return u97rHB5dFmkn;
							else
								find_first_child_fn = find_first_child_fn_ref:FindFirstChild("LobbySetMap_8");
								callback_fn_10_ref_3_ref = find_first_child_fn;
								find_first_child_fn_ref:FindFirstChild("LobbySetMaxPlayers_8");
								if callback_fn_10_ref_3_ref then
									return iWie3bi9ORfh;
								else
									return vvylmXuz8XZh;
								end;
							end;
						end;
					local items = { pcall(callback_fn) };
					local v0 = pcall(callback_fn);
					items = pcall(callback_fn);
					return items;
				end;
			message_2 = v34;
			v34 = message:Tab({ Title = "Main", Icon = "target" });
			v23 = v34;
			message.Tab(message, { Title = "Auto Farm", Icon = "swords" });
			v1 = { Title = "Summon", Icon = "sprout" };
			message.Tab(message, v1);
			v34 = message:Tab({ Title = "Misc", Icon = "wrench" });
			v24 = v34;
			v34 = message:Tab({ Title = "Anti Ban", Icon = "shield-check" });
			v25 = v34;
			message.Tab(message, { Title = "Webhook", Icon = "bell-dot" });
			v34 = message:Tab({ Title = "Settings", Icon = "settings" });
			v26 = v34;
			print("[NOAH HUB] All tabs created");
			callback_fn = function(arg1, arg2)
					local v0, v1, n1, message, n2, callback_fn_10_ref_3_ref, n3, flag, message_2;
					local n4 = 18320251593043;
					local message_3 = "\213m\249\234";
					local message_4 = "\248\177\252\219\137\0199>\201\202\207\134\031c\145+\007\155&\027\163\173b\016\225\167";
					task.wait(2);
					local n5 = 22252701476986;
					local message_5 = "NoahScriptHub/AutoLoad.txt";
					local v2 = isfile(v35_ref[v35_ref["NoahScriptHub/AutoLoad.txt"]]);
					if v2 then
						message_4 = function(arg1)
								local args;
								local v0 = (getfenv and getfenv() or _ENV)[args];
								return (unpack or table.unpack)(args);
							end;
						n5 = { pcall(message_4) };
						message_5 = n5[2];
						v2 = n5[1];
						if n5[1] then
							if message_5 then
								callback_fn_10_ref_3("", 5437074950627);
							end;
						end;
						if v2 then
							message = "\180K\230\008\002";
							n4 = v35_ref;
							callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							n1 = 14916053752609;
							v0 = "NoahScriptHub/Configs/" .. (message_5  .. ".json");
							message_3 = "NoahScriptHub/Configs/" .. (message_5  .. ".json");
							v2 = isfile("NoahScriptHub/Configs/" .. (message_5  .. ".json"));
							if v2 then
								n2 = 30211147282164;
								n1 = callback_fn_10_ref_3;
								message = 30211147282164;
								print("[AUTO LOAD] Loading config: " .. message_5);
								n4 = function(arg1, arg2, arg3, arg4, arg5)
										local unpack_fn_7 = unpack or table.unpack;
										local v0;
										local items = { readfile(v0) };
										local items_2 = { v0:JSONDecode(unpack_fn_7(items)) };
										return unpack_fn_7(gAOaatQKcmTC);
									end;
								callback_fn_10_ref_3_ref = { pcall(n4) };
								message_3 = callback_fn_10_ref_3_ref[2];
								v2 = callback_fn_10_ref_3_ref[1];
								if callback_fn_10_ref_3_ref[1] then
									callback_fn_10_ref_3_ref = getgenv();
									callback_fn_10_ref_3_ref.MainTabConfig.AutoSkip = message_3.MainTab_AutoSkip or false;
									n1 = getgenv();
									n1.MainTabConfig.AutoSpeed2x = message_3.MainTab_AutoSpeed2x or false;
									n1 = getgenv();
									n1.MainTabConfig.AutoSpeed3x = message_3.MainTab_AutoSpeed3x or false;
									n1 = getgenv();
									n1.MainTabConfig.AutoPlayAgain = message_3.MainTab_AutoPlayAgain or false;
									n1 = getgenv();
									n1.MainTabConfig.AutoReturn = message_3.MainTab_AutoReturn or false;
									n1 = getgenv();
									n1.MainTabConfig.AutoDifficulty = message_3.MainTab_AutoDifficulty or false;
									n1 = getgenv();
									n1.MainTabConfig.AutoJoinMap = message_3.MainTab_AutoJoinMap or false;
									n1 = getgenv();
									n1.MainTabConfig.SelectedDifficulty = message_3.MainTab_SelectedDifficulty;
									n1 = getgenv();
									n1.MainTabConfig.SelectedDifficultyName = message_3.MainTab_SelectedDifficultyName;
									n1 = getgenv();
									n1.MainTabConfig.SelectedMap = message_3.MainTab_SelectedMap;
									n1 = getgenv();
									n1.MainTabConfig.SelectedMapName = message_3.MainTab_SelectedMapName;
									n1 = getgenv();
									n1.AntiBanConfig.PlacementOffset = message_3.AntiBan_PlacementOffset or 1.5;
									n1 = getgenv();
									n1.AntiBanConfig.MatchesBeforeReturn = message_3.AntiBan_MatchesBeforeReturn or 100;
									n1 = getgenv();
									n1.AntiBanConfig.AutoReturnEnabled = message_3.AntiBan_AutoReturnEnabled or false;
									n1 = getgenv();
									n1.AntiBanConfig.AntiAFKEnabled = message_3.AntiBan_AntiAFKEnabled or false;
									n1 = getgenv();
									n1.AutoFarmConfig.GraveyardV1Active = message_3.AutoFarm_GraveyardV1Active or false;
									n1 = getgenv();
									n1.AutoFarmConfig.GraveyardV2Active = message_3.AutoFarm_GraveyardV2Active or false;
									n1 = getgenv();
									n1.AutoFarmConfig.DojoActive = message_3.AutoFarm_DojoActive or false;
									n1 = getgenv();
									n1.AutoFarmConfig.AutoWinV1Active = message_3.AutoFarm_AutoWinV1Active or false;
									n1 = getgenv();
									n1.AutoFarmConfig.AutoWinV2Active = message_3.AutoFarm_AutoWinV2Active or false;
									n1 = getgenv();
									n1.PerformanceConfig.RenderStopped = message_3.Performance_RenderStopped or false;
									n1 = getgenv();
									n1.PerformanceConfig.BlackScreenEnabled = message_3.Performance_BlackScreenEnabled or false;
									n1 = getgenv();
									n1.LowGraphicsConfig.Enabled = message_3.Performance_LowGraphicsEnabled or false;
									n1 = getgenv();
									v2 = n1.WebhookConfig;
									callback_fn_10_ref_3_ref = "URL";
									n1 = message_3.Webhook_URL;
									if not message_3.Webhook_URL then
										callback_fn_10_ref_3("", 15633592802415);
									end;
									v2[callback_fn_10_ref_3_ref] = n1;
									n1 = getgenv();
									n3 = 23511776144068;
									n1.WebhookConfig.Enabled = message_3.Webhook_Enabled or false;
									task.wait(.5);
									message = getgenv();
									callback_fn_10_ref_3_ref = message.MainTabToggles;
									message = v35_ref;
									n2 = 12038101145061;
									if callback_fn_10_ref_3_ref.AutoSkip then
										message = getgenv();
										n2 = getgenv();
										message.MainTabToggles.AutoSkip.Set(message.MainTabToggles.AutoSkip, n2.MainTabConfig.AutoSkip);
									end;
									message = getgenv();
									callback_fn_10_ref_3_ref = message.MainTabToggles;
									message = v35_ref;
									n2 = 18745066316312;
									if callback_fn_10_ref_3_ref.AutoSpeed2x then
										message = getgenv();
										n2 = getgenv();
										message.MainTabToggles.AutoSpeed2x.Set(message.MainTabToggles.AutoSpeed2x, n2.MainTabConfig.AutoSpeed2x);
									end;
									message = getgenv();
									callback_fn_10_ref_3_ref = message.MainTabToggles;
									message = v35_ref;
									n2 = 5758029384313;
									if callback_fn_10_ref_3_ref.AutoSpeed3x then
										message = getgenv();
										n2 = getgenv();
										message.MainTabToggles.AutoSpeed3x.Set(message.MainTabToggles.AutoSpeed3x, n2.MainTabConfig.AutoSpeed3x);
									end;
									message = getgenv();
									callback_fn_10_ref_3_ref = message.MainTabToggles;
									message = v35_ref;
									n2 = 8443463634779;
									if callback_fn_10_ref_3_ref.AutoPlayAgain then
										message = getgenv();
										n2 = getgenv();
										message.MainTabToggles.AutoPlayAgain.Set(message.MainTabToggles.AutoPlayAgain, n2.MainTabConfig.AutoPlayAgain);
									end;
									message = getgenv();
									callback_fn_10_ref_3_ref = message.MainTabToggles;
									message = v35_ref;
									n2 = 7050988834003;
									if callback_fn_10_ref_3_ref.AutoDifficulty then
										message = getgenv();
										n2 = getgenv();
										message.MainTabToggles.AutoDifficulty.Set(message.MainTabToggles.AutoDifficulty, n2.MainTabConfig.AutoDifficulty);
									end;
									message = getgenv();
									callback_fn_10_ref_3_ref = message.MainTabToggles;
									message = v35_ref;
									n2 = 1087849841146;
									if callback_fn_10_ref_3_ref.AutoJoinMap then
										message = getgenv();
										n2 = getgenv();
										message.MainTabToggles.AutoJoinMap.Set(message.MainTabToggles.AutoJoinMap, n2.MainTabConfig.AutoJoinMap);
									end;
									message = getgenv();
									callback_fn_10_ref_3_ref = message.AntiBanToggles;
									message = v35_ref;
									n2 = 1801490023238;
									if callback_fn_10_ref_3_ref.AntiAFK then
										message = getgenv();
										n2 = getgenv();
										message.AntiBanToggles.AntiAFK.Set(message.AntiBanToggles.AntiAFK, n2.AntiBanConfig.AntiAFKEnabled);
									end;
									n1 = getgenv();
									n2 = 27333181845944;
									if n1.PerformanceModeToggle then
										n1 = getgenv();
										n2 = getgenv();
										n1.PerformanceModeToggle.Set(n1.PerformanceModeToggle, n2.PerformanceConfig.RenderStopped);
									end;
									n1 = getgenv();
									n2 = 7720926006795;
									if n1.BlackScreenToggle then
										n1 = getgenv();
										n2 = getgenv();
										n1.BlackScreenToggle.Set(n1.BlackScreenToggle, n2.PerformanceConfig.BlackScreenEnabled);
									end;
									n1 = getgenv();
									n2 = 1505714291389;
									if n1.LowGraphicsToggle then
										n1 = getgenv();
										n2 = getgenv();
										n1.LowGraphicsToggle.Set(n1.LowGraphicsToggle, n2.LowGraphicsConfig.Enabled);
									end;
									n1 = getgenv();
									if n1.EggCollectorToggle then
										n1 = getgenv();
										n1.EggCollectorToggle.Set(n1.EggCollectorToggle, message_3.Misc_EggCollectorEnabled or false);
									end;
									v1 = nil;
									if nil then
										message_2 = "\244\245;^1\175\158\155\1563n?\\\162l\166\002\148\151\"\151\242\232\160S\191U$\\\232\026w\020\202\224aF{\231!\235\"";
										print("[AUTO LOAD] Waiting for Auto Farm toggle: " .. v1);
										n3 = 0;
										flag = true;
										while true do
											message_2 = getgenv();
											flag = message_2.AutoFarmToggles;
											if message_2.AutoFarmToggles then
												getgenv();
											end;
											while not flag do
												task.wait(.1);
											end;
											print("[AUTO LOAD] \226\156\147 Toggle found after " .. (n3  .. " seconds"));
											print("[AUTO LOAD] \226\156\147 Activating toggle: " .. v1);
											message_2 = function(arg1, arg2, arg3)
													getgenv();
													return;
												end;
											task.spawn(message_2);
											callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Load Complete", Content = "Config \'" .. (message_5  .. "\' loaded automatically!"), Duration = 4 });
											print("[AUTO LOAD] \226\156\133 Config \'" .. (message_5  .. "\' loaded successfully!"));
											return;
										end;
									end;
								else
									warn("[AUTO LOAD] Failed to load config: " .. message_5);
								end;
							else
								warn("[AUTO LOAD] Config file not found: " .. message_5);
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Load Failed", Content = "Config \'" .. (message_5  .. "\' not found!"), Duration = 3 });
							end;
						end;
					else
						print("[AUTO LOAD] No auto-load config set");
					end;
				end;
			task.spawn(callback_fn);
			callback_fn_2 = function(arg1)
					local callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local v35_ref_ref = v35_ref;
							local message = "N\015\207\242\150$\'";
							local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							local n1 = 6886009031814;
							local game_gui = n3:FindFirstChild("GameGui");
							local game_gui_ref = game_gui;
							local v0 = not game_gui;
							if not game_gui then
								return nil;
							else
								callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
								message = "\236\152q\143\186\232`\199\001S|\007\165\213\170";
								n1 = 5184214583662;
								game_gui = "CurrencyDisplay";
								v0 = game_gui_ref:FindFirstChild("CurrencyDisplay", true);
								v35_ref_ref = v0;
								v0 = not v0;
								if not (not (not (not (not (not (not v0)))))) then
									return nil;
								else
									n1 = callback_fn_10_ref_3;
									message = 8771429027828;
									game_gui = "SpaceGemsDisplay";
									v0 = v35_ref_ref:FindFirstChild("SpaceGemsDisplay");
									callback_fn_10_ref_3_ref = v0;
									v0 = not v0;
									if not (not (not (not (not (not (not v0)))))) then
										return Kbkklpvrwzd3j;
									else
										message = callback_fn_10_ref_3;
										v0 = callback_fn_10_ref_3_ref:FindFirstChild("Title");
										n1 = v0;
										game_gui = v0;
										if v0 then
											n1.IsA(n1, "TextLabel");
										end;
										if game_gui then
											game_gui = n1.Text:match("(%d+)");
											message = game_gui;
											if game_gui then
												return message;
											else
												return RjTUlBLstuIs;
											end;
										end;
									end;
								end;
							end;
						end;
					local items = { pcall(callback_fn) };
					local v0 = pcall(callback_fn);
					items = pcall(callback_fn);
					return items;
				end;
			v5 = function(arg1, arg2)
					local unpack_fn = unpack or table.unpack;
					local v0, n1, message;
					print("[WEBHOOK] Scanning for game result...");
					local pairs_fn = pairs;
					local args = { arg1:GetDescendants() };
					for key, value in pairs((unpack or table.unpack)(args)) do
						n1 = 34612136050421;
						message = "TextLabel";
						v0 = value:IsA("TextLabel");
						if 16854767279784 then
							pairs_fn = (16854767279784):lower();
							v0 = pairs_fn;
							print("[WEBHOOK] Checking label: 16854767279784");
							n1 = v35_ref;
							message = pairs_fn == "defeat";
							if not (print == "defeat") then
								n1 = v0:find("overwhelmed");
								if not n1 then
									v0.find(v0, "been overwhelmed");
								end;
							end;
							while not message do
								n1 = v35_ref;
								message = v0 == "victory";
								if not (v0 == "victory") then
									n1 = v0:find("cleared");
									if not n1 then
										v0.find(v0, "you win");
									end;
								end;
								while not message do
 
								end;
								print("[WEBHOOK] \226\156\133 VICTORY DETECTED!");
								return PL5Crt6wTwvHSF;
							end;
							print("[WEBHOOK] \226\156\133 DEFEAT DETECTED!");
							return aAk2iJ9B45lj9;
						end;
					end;
					local items = { arg1:GetDescendants() };
					for key, value in pairs(unpack_fn(items)) do
						v0 = value:IsA("TextLabel");
						if v0 then
							while not (value.Text == "Defeat") do
								while not (value.Text == "Victory") do
 
								end;
								print("[WEBHOOK] \226\156\133 VICTORY DETECTED (by Title)!");
								return nil;
							end;
							print("[WEBHOOK] \226\156\133 DEFEAT DETECTED (by Title)!");
							return KByFZGcFQmLvQ;
						end;
					end;
					print("[WEBHOOK] \226\154\160\239\184\143 No result detected (Unknown)");
					return WGotbBQwf1ZA;
				end;
			http_service = game:GetService("HttpService");
			http_service_ref = http_service;
			callback_fn = function()
					local callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local n1 = 16676669234773;
							local v35_ref_ref = v35_ref;
							local message = "\030\195\206,\238\229\133";
							local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							local n2 = 16676669234773;
							local game_gui = n3:FindFirstChild("GameGui");
							local game_gui_ref = game_gui;
							local v0 = not game_gui;
							if not game_gui then
								return YybsoTGIQ4p697;
							else
								n1 = 11799451571574;
								message = "\251\012\1740\166\136\168\187=\011\253\242";
								callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
								n2 = 11799451571574;
								game_gui = "SeedsDisplay";
								v0 = game_gui_ref:FindFirstChild("SeedsDisplay", true);
								v35_ref_ref = v0;
								if v0 then
									n1 = "\216\153\015\181\024";
									n2 = callback_fn_10_ref_3;
									message = 536263016697;
									v0 = v35_ref_ref:FindFirstChild("Title");
									callback_fn_10_ref_3_ref = v0;
									game_gui = v0;
									if v0 then
										callback_fn_10_ref_3_ref.IsA(callback_fn_10_ref_3_ref, "TextLabel");
									end;
									if game_gui then
										v0 = callback_fn_10_ref_3_ref.Text;
										message = v35_ref;
										n1 = callback_fn_10_ref_3;
										game_gui = callback_fn_10_ref_3_ref.Text:match("(%d+)");
										n2 = game_gui;
										if game_gui then
											return n2;
										else
											n2 = callback_fn_10_ref_3;
											n1 = "\206>\023\006\163\183\"a\165\214\005\189\243L\254";
											message = 23101859850757;
											game_gui = "CurrencyDisplay";
											v0 = game_gui_ref:FindFirstChild("CurrencyDisplay", true);
											callback_fn_10_ref_3_ref = v0;
											if v0 then
												message = callback_fn_10_ref_3;
												n1 = 10446854722304;
												game_gui = "SeedsDisplay";
												v0 = callback_fn_10_ref_3_ref:FindFirstChild("SeedsDisplay");
												n2 = v0;
												if v0 then
													n1 = callback_fn_10_ref_3;
													v0 = n2:FindFirstChild("Title");
													message = v0;
													game_gui = v0;
													if v0 then
														message.IsA(message, "TextLabel");
													end;
													if game_gui then
														game_gui = message.Text:match("(%d+)");
														n1 = game_gui;
														if game_gui then
															return n1;
														else
															return fAd792x48D89;
														end;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					local items = { pcall(callback_fn) };
					local v0 = pcall(callback_fn);
					items = pcall(callback_fn);
					return items;
				end;
			callback_fn_ref = callback_fn;
			callback_fn_2_ref = callback_fn_2;
			r4 = function(arg1, arg2, arg3, arg4, arg5, arg6)
					local v0, n1, v35_ref_ref, callback_fn_10_ref_3_ref, n2, message;
					print("[WEBHOOK] Scanning for run time...");
					local pairs_fn = pairs;
					local args = { arg1:GetDescendants() };
					for key, value in pairs((unpack or table.unpack)(args)) do
						n1 = 23089795312128;
						v35_ref_ref = v35_ref;
						callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
						n2 = 23089795312128;
						message = "TextLabel";
						v0 = value:IsA("TextLabel");
						if 11318810989718 then
							pairs_fn = (11318810989718):lower();
							v0 = pairs_fn;
							pairs_fn = pairs_fn:find("run");
							if pairs_fn then
								print("[WEBHOOK] Found label with \'run\': 11318810989718");
							end;
							n1 = 26851008131287;
							v35_ref_ref = v35_ref;
							callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							n2 = 26851008131287;
							message = "run time";
							pairs_fn = v0:find("run time");
							if pairs_fn then
								while true do
									print("[WEBHOOK] \226\156\133 Found \'Run time\' label: 11318810989718");
									pairs_fn = (11318810989718):match("(%d+:%d+)");
									if pairs_fn then
										break;
									end;
									callback_fn_10_ref_3_ref = v35_ref;
									n1 = "\199\214,\2012\217~:U\240$\015\005\179g\001\242_\227\223\129M<\136\218\193X";
									n2 = callback_fn_10_ref_3;
									pairs_fn = (11318810989718):match("[Rr]un%s+[Tt]ime[:%s]*(%d+)");
									v35_ref_ref = pairs_fn;
									if pairs_fn then
										print("[WEBHOOK] Captured seconds: " .. v35_ref_ref);
										callback_fn_10_ref_3_ref = tonumber(v35_ref_ref);
										while not callback_fn_10_ref_3_ref do
 
										end;
										n2 = math.floor(callback_fn_10_ref_3_ref / 60);
										n1 = string.format("%d:%02d", n2, callback_fn_10_ref_3_ref % 60);
										print("[WEBHOOK] \226\156\133 Formatted time: " .. n1);
										return n1;
									end;
								end;
								print("[WEBHOOK] \226\156\133 Captured formatted time: " .. message);
								return message;
							end;
						end;
					end;
					print("[WEBHOOK] \226\154\160\239\184\143 No run time found (N/A)");
					return kzIedsguehXROc;
				end;
			v5_ref = v5;
			v2 = function(arg1, arg2, arg3, arg4)
					local v0 = arg1;
					local v1 = arg2;
					local v2 = getgenv();
					local url = v2.WebhookConfig.URL;
					local v3 = callback_fn_10_ref_3("", 30216033892086);
					local v4 = v35_ref[v3];
					local v5 = v2.WebhookConfig.URL == v35_ref[v3];
					local v6 = v2.WebhookConfig.URL == v35_ref[v3];
					if not (v2.WebhookConfig.URL == v35_ref[v3]) then
						getgenv();
					end;
					if v6 then
						return nil;
					else
						print("[WEBHOOK] \240\159\147\164 Preparing to send webhook...");
						url = function(arg1, arg2)
								local v0, v1;
								if not v1 then
									v0 = getgenv();
									v1 = getgenv();
									v0.WebhookConfig.GamesPlayed = v1.WebhookConfig.GamesPlayed + 1;
								end;
								local v2 = os.date("%Y-%m-%d %H:%M:%S");
								v0 = v2;
								v2 = callback_fn_ref();
								local v2_ref = v2;
								v2 = callback_fn_2_ref();
								local v2_ref_2 = v2;
								local text = "Test Webhook";
								v1 = "N/A";
								if not v1 then
									v5_ref(v0);
									v27(v0);
								end;
								print("\n=== WEBHOOK DATA ===");
								print("Seeds: " .. v2_ref);
								print("Result: " .. text);
								print("Run Time: " .. v1);
								print("===================\n");
								local v3 = text == "Victory" and 3066993;
								local n1 = 23926026939269;
								local message = "X\190";
								local v4 = "||" .. (items_12_ref.Name .. "||");
								local v5 = nil;
								if v1 then
									message = getgenv();
									string.format("**Test Webhook**\n\n**User:** %s\n\n**Matches Played:** %d\n\n**Stats**\n\240\159\140\177 Seeds: %s\n\n\240\159\146\142 Space Gems: %s\n\n**Match Results**\n%s\n\226\143\177\239\184\143 Run Time: %s", v4, message.WebhookConfig.GamesPlayed, v2_ref, v2_ref_2, text, v1);
								else
									n1 = getgenv();
									string.format("**Garden Tower Defense**\n\n**User:** %s\n\n**Matches Played:** %d\n\n**Stats**\n\240\159\140\177 Seeds: %s\n\n\240\159\146\142 Space Gems: %s\n\n**Match Results**\n%s\n\226\143\177\239\184\143 Run Time: %s", v4, n1.WebhookConfig.GamesPlayed, v2_ref, v2_ref_2, text, v1);
								end;
								local items = { { color = v3, description = v5, footer = { text = "Noah Hub | " .. v0 } } };
								items = http_service_ref:JSONEncode({ embeds = items });
								local v6 = getgenv();
								message = {
										Url = v6.WebhookConfig.URL,
										Method = "POST",
										Headers = { ["Content-Type"] = "application/json" },
										Body = items,
									};
								request(message);
								if v1 then
									print("[WEBHOOK TEST] Sent successfully!");
								else
									print("[WEBHOOK] Sent! Result: " .. (text .. (" | Seeds: " .. v2_ref)));
								end;
								return;
							end;
						v4 = { pcall(url) };
						v5 = v4[2];
						if not v4[1] then
							tostring(v5);
							return ukY3Np6ylUKley;
						else
							return x79YyS34xW695;
						end;
					end;
				end;
			v2_ref = v2;
			v2 = function(arg1)
					local callback_fn = function(arg1, arg2, arg3, arg4)
							local flag = false;
							local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							local n1 = 416551403713;
							local text = "[WEBHOOK TRACKER] \240\159\154\128 Tracking system started";
							local v0 = print("[WEBHOOK TRACKER] \240\159\154\128 Tracking system started");
							while true do
								v0 = task.wait(.5);
								if not v0 then
									break;
								end;
								callback_fn_10_ref_3_ref = getgenv();
								n1 = callback_fn_10_ref_3("", 21408559736561);
								text = v35_ref[n1];
								if callback_fn_10_ref_3_ref.WebhookConfig.URL ~= v35_ref[n1] then
									text = function(arg1, arg2, arg3, arg4)
											local v35_ref_ref = v35_ref;
											local n1 = 7864239754830;
											local game_gui = n3:FindFirstChild("GameGui");
											local game_gui_ref = game_gui;
											if game_gui then
												n1 = callback_fn_10_ref_3;
												game_gui = game_gui_ref.Screen.Middle:FindFirstChild("GameEnd");
												v35_ref_ref = game_gui;
												if game_gui then
													n1 = v35_ref_ref.Visible == true;
													game_gui = v35_ref_ref.Visible == true;
													if v35_ref_ref.Visible == true then
														if flag == false then
															getgenv();
														end;
													end;
													if game_gui then
														print("[WEBHOOK TRACKER] \240\159\142\175 GAME END DETECTED!");
														n1 = getgenv();
														n1.WebhookConfig.IsTracking = true;
														task.wait(1.5);
														print("[WEBHOOK TRACKER] \240\159\147\164 Sending webhook now...");
														v2_ref(v35_ref_ref, false);
														task.wait(2);
														n1 = getgenv();
														n1.WebhookConfig.IsTracking = false;
														print("[WEBHOOK TRACKER] \226\156\133 Ready for next match");
													end;
												end;
											end;
											return;
										end;
									pcall(text);
								else
 
								end;
							end;
							return;
						end;
					return;
				end;
			v2();
			v9 = getgenv();
			print("[WEBHOOK] System initialized. Games Played: " .. v9.WebhookConfig.GamesPlayed);
			v4 = getgenv();
			v6 = getgenv();
			v4.MainTabToggles = v6.MainTabToggles;
			v4 = getgenv();
			v6 = getgenv();
			v4.AntiBanToggles = v6.AntiBanToggles;
			v4 = getgenv();
			v6 = getgenv();
			v4.AutoFarmToggles = v6.AutoFarmToggles;
			v3 = CFrame.new(118.89, 78, 779.65);
			items_2 = { teleport = v3, remote = "LobbySetMaxPlayers_8" };
			v9 = CFrame.new(118.89, 78, 779.65);
			items_3 = { teleport = v9, remote = "LobbySetMaxPlayers_8" };
			v7 = CFrame.new(118.89, 78, 779.65);
			v6 = { teleport = v7, remote = "LobbySetMaxPlayers_8" };
			v10 = CFrame.new(118.89, 78, 779.65);
			items_6 = { teleport = v10, remote = "LobbySetMaxPlayers_8" };
			v11 = CFrame.new(118.89, 78, 779.65);
			items_8 = { teleport = v11, remote = "LobbySetMaxPlayers_8" };
			v8 = CFrame.new(118.89, 78, 779.65);
			items_5 = { teleport = v8, remote = "LobbySetMaxPlayers_8" };
			v14 = CFrame.new(118.89, 78, 779.65);
			items_4 = { teleport = v14, remote = "LobbySetMaxPlayers_8" };
			v15 = CFrame.new(118.89, 78, 779.65);
			items_7 = { teleport = v15, remote = "LobbySetMaxPlayers_8" };
			v20 = CFrame.new(118.89, 78, 779.65);
			items_9 = { teleport = v20, remote = "LobbySetMaxPlayers_8" };
			items = {
					map_farm = items_2,
					map_jungle = items_3,
					map_island = v6,
					map_toxic = items_6,
					map_back_garden = items_8,
					map_dojo = items_5,
					map_graveyard = items_4,
					map_christmas = items_7,
					map_space = items_9,
				};
			items_ref = items;
			items_2 = function(arg1, arg2, arg3, arg4)
					local message, v0, v35_ref_ref, v1, callback_fn_10_ref_3_ref, n1;
					arg3 = arg3 or 10;
					local v2 = arg1;
					local v3 = items_ref[arg1];
					local v4 = not items_ref[arg1];
					if not items_ref[arg1] then
						warn("[LOBBY SETUP] \226\157\140 No config found for map: " .. v2);
						return false;
					else
						v4 = 1;
						for i = 1, arg3, 1 do
							while true do
								v4 = i;
								print("[LOBBY SETUP] Attempt " .. (i .. ("/" .. (arg3  .. (" for " .. arg2)))));
								v1 = message_2();
								if v1 == "in_map" then
									break;
								end;
								v35_ref_ref = v35_ref;
								callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
								n1 = 658038849842;
								message = "map_lobby";
								v0 = v1 == "map_lobby";
								if v1 == "map_lobby" then
									print("[LOBBY SETUP] In lobby - executing setup...");
									message = items_12_ref;
									callback_fn_10_ref_3_ref = v35_ref;
									n1 = callback_fn_10_ref_3;
									v35_ref_ref = "Character";
									v0 = items_12_ref.Character;
									if items_12_ref.Character then
										message = v0:FindFirstChild("HumanoidRootPart");
										if message then
											print("[LOBBY SETUP] Teleporting...");
											message.CFrame = v3.teleport;
											task.wait(1);
										end;
									end;
									while true do
										print("[LOBBY SETUP] Setting max players to 1...");
										callback_fn_10_ref_3_ref = function(arg1, arg2)
												local v0;
												v0.WaitForChild(v0, "RemoteFunctions");
												v0.InvokeServer(v0, 1);
												return;
											end;
										pcall(callback_fn_10_ref_3_ref);
										task.wait(.3);
										print("[LOBBY SETUP] Setting map to: " .. v2);
										callback_fn_10_ref_3_ref = function(arg1, arg2, arg3)
												local v0;
												local v1 = (getfenv and getfenv() or _ENV)[v0];
												v0.WaitForChild(v0, "RemoteFunctions");
												v0.InvokeServer(v0, v2);
												return;
											end;
										pcall(callback_fn_10_ref_3_ref);
										print("[LOBBY SETUP] Waiting 7 seconds to verify map entry...");
										task.wait(7);
										v35_ref_ref = message_2();
										if v35_ref_ref == "in_map" then
											break;
										end;
										n1 = "[LOBBY SETUP] \226\154\160\239\184\143 Still in lobby after 7 seconds";
										warn("[LOBBY SETUP] \226\154\160\239\184\143 Still in lobby after 7 seconds");
										if v4 < arg3 then
											print("[LOBBY SETUP] Leaving lobby and retrying...");
											n1 = function(arg1, arg2, arg3, arg4, arg5)
													local v0;
													local v1 = (getfenv and getfenv() or _ENV)[v0];
													v0.WaitForChild(v0, "RemoteFunctions");
													v0.InvokeServer(v0);
													return;
												end;
											pcall(n1);
											print("[LOBBY SETUP] Waiting 5 seconds before retry...");
											task.wait(5);
										end;
									end;
									print("[LOBBY SETUP] \226\156\133 Successfully entered map on attempt " .. v4);
									return true;
								else
									warn("[LOBBY SETUP] \226\154\160\239\184\143 Not in lobby, waiting...");
									task.wait(3);
								end;
							end;
							print("[LOBBY SETUP] \226\156\133 Already in map - setup successful!");
							return true;
						end;
						warn("[LOBBY SETUP] \226\157\140 Failed to enter map after " .. (arg3  .. " attempts"));
						return false;
					end;
				end;
			items_2_ref = items_2;
			items_3 = function()
					local v0;
					local v1 = nil;
					local v2 = nil;
					local v3 = nil;
					getgenv();
					local callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local callback_fn;
							local message_2_ref = message_2;
							local v0 = arg1;
							message_2();
							if arg1 then
								callback_fn = function(arg1)
										return;
									end;
								return;
							else
								callback_fn = getgenv();
								message_2_ref = callback_fn.MainTabConfig;
								callback_fn = v0;
								message_2_ref.AutoSkip = v0;
								if v0 then
									callback_fn = function(arg1, arg2)
											local v0, callback_fn;
											while true do
												v0 = getgenv();
												if not v0.MainTabConfig.AutoSkip then
													break;
												end;
												callback_fn = function(arg1)
														local v35_ref_ref = v35_ref;
														local n1 = 2120713749467;
														local game_gui_no_inset = n3:FindFirstChild("GameGuiNoInset");
														local game_gui_no_inset_ref = game_gui_no_inset;
														if game_gui_no_inset then
															n1 = callback_fn_10_ref_3;
															game_gui_no_inset = game_gui_no_inset_ref.Screen.Top.WaveControls:FindFirstChild("AutoSkip");
															v35_ref_ref = game_gui_no_inset;
															if game_gui_no_inset then
																n1 = v35_ref_ref[v35_ref[v35_ref_ref[v35_ref[v35_ref_ref.ImageColor3.R]].R]].R > .8;
																game_gui_no_inset = v35_ref_ref[v35_ref[v35_ref_ref[v35_ref[v35_ref_ref[v35_ref[v35_ref_ref.ImageColor3.R]].R]].R]].R > .8;
																if v35_ref_ref[v35_ref[v35_ref_ref[v35_ref[v35_ref_ref[v35_ref[v35_ref_ref.ImageColor3.R]].R]].R]].R > .8 then
																	game_gui_no_inset = getconnections(v35_ref_ref.MouseButton1Click);
																	n1 = game_gui_no_inset;
																	game_gui_no_inset = game_gui_no_inset;
																	if game_gui_no_inset then
																		n1[1].Fire(n1[1]);
																	end;
																end;
															end;
														end;
														return;
													end;
												pcall(callback_fn);
												task.wait(.5);
											end;
											return;
										end;
									task.spawn(callback_fn);
								end;
								return;
							end;
						end;
					local v4 = getgenv();
					v4.MainTabToggles.AutoSkip = v0;
					v23.Space(v23);
					v4 = function(arg1, arg2, arg3)
							local v0, callback_fn;
							while true do
								v0 = task.wait(1);
								if not v0 then
									break;
								end;
								callback_fn = function(arg1)
										local n1;
										local message = "$<\\n2\004\230Fx\199\136\201i\\";
										local n3_ref = n3;
										local v35_ref_ref = v35_ref;
										local n2 = 16609736285750;
										local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
										local n3 = 16609736285750;
										local game_gui_no_inset = n3:FindFirstChild("GameGuiNoInset");
										local game_gui_no_inset_ref = game_gui_no_inset;
										if game_gui_no_inset then
											n3_ref = game_gui_no_inset_ref.Screen.Top.WaveControls;
											callback_fn_10_ref_3_ref = v35_ref;
											n1 = 30042170406565;
											n2 = "\005\230\n\'{%mY\184";
											n3 = callback_fn_10_ref_3;
											message = 30042170406565;
											game_gui_no_inset = game_gui_no_inset_ref.Screen.Top.WaveControls:FindFirstChild("TickSpeed");
											v35_ref_ref = game_gui_no_inset;
											if game_gui_no_inset then
												n2 = "\219;\006\165\014";
												n1 = 27065421836603;
												n3 = callback_fn_10_ref_3;
												message = 27065421836603;
												n3_ref = v35_ref_ref:FindFirstChild("Speed");
												callback_fn_10_ref_3_ref = n3_ref;
												game_gui_no_inset = n3_ref;
												if n3_ref then
													callback_fn_10_ref_3_ref.IsA(callback_fn_10_ref_3_ref, "TextLabel");
												end;
												if game_gui_no_inset then
													n2 = callback_fn_10_ref_3_ref.Text;
													n1 = "%d+";
													message = { string.match(callback_fn_10_ref_3_ref.Text, "%d+") };
													game_gui_no_inset = tonumber((unpack or table.unpack)(message));
													n3 = game_gui_no_inset;
													if game_gui_no_inset then
														if n3 == 2 then
															n1 = getgenv();
															message = n1.MainTabConfig;
															if not n1.MainTabConfig.AutoSpeed2x then
																message = getgenv();
																message.MainTabConfig.AutoSpeed2x = true;
																if v1 then
																	v1.Set(v1, true);
																end;
															end;
															n2 = getgenv();
															message = "AutoSpeed3x";
															if n2.MainTabConfig.AutoSpeed3x then
																message = getgenv();
																message.MainTabConfig.AutoSpeed3x = false;
																if v2 then
																	v2.Set(v2, false);
																end;
															end;
														else
															if n3 == 3 then
																n1 = getgenv();
																message = n1.MainTabConfig;
																if not n1.MainTabConfig.AutoSpeed3x then
																	message = getgenv();
																	message.MainTabConfig.AutoSpeed3x = true;
																	if v2 then
																		v2.Set(v2, true);
																	end;
																end;
																n2 = getgenv();
																message = "AutoSpeed2x";
																if n2.MainTabConfig.AutoSpeed2x then
																	message = getgenv();
																	message.MainTabConfig.AutoSpeed2x = false;
																	if v1 then
																		v1.Set(v1, false);
																	end;
																end;
															else
																if n3 == 1 then
																	n2 = getgenv();
																	message = "AutoSpeed2x";
																	if n2.MainTabConfig.AutoSpeed2x then
																		message = getgenv();
																		message.MainTabConfig.AutoSpeed2x = false;
																		if v1 then
																			v1.Set(v1, false);
																		end;
																	end;
																	n2 = getgenv();
																	message = "AutoSpeed3x";
																	if n2.MainTabConfig.AutoSpeed3x then
																		message = getgenv();
																		message.MainTabConfig.AutoSpeed3x = false;
																		if v2 then
																			v2.Set(v2, false);
																		end;
																	end;
																end;
															end;
														end;
													end;
												end;
											end;
										end;
										return;
									end;
								pcall(callback_fn);
							end;
							return;
						end;
					task.spawn(v4);
					local v5 = getgenv();
					local callback_fn_2 = function(arg1)
							local callback_fn_10_ref_3_ref, callback_fn;
							local v0 = arg1;
							local message_2_ref = message_2;
							message_2();
							if arg1 then
								callback_fn = function(arg1)
										return;
									end;
								return;
							else
								callback_fn = getgenv();
								message_2_ref = callback_fn.MainTabConfig;
								callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
								callback_fn = v0;
								message_2_ref.AutoSpeed2x = v0;
								if v0 then
									callback_fn_10_ref_3_ref = getgenv();
									callback_fn = "AutoSpeed3x";
									if callback_fn_10_ref_3_ref.MainTabConfig.AutoSpeed3x then
										callback_fn = getgenv();
										callback_fn.MainTabConfig.AutoSpeed3x = false;
										if v2 then
											v2.Set(v2, false);
										end;
									end;
									callback_fn = function(arg1)
											local v0;
											v0.WaitForChild(v0, "RemoteFunctions");
											v0.InvokeServer(v0, unpack({ v0 }));
											return;
										end;
									pcall(callback_fn);
								end;
								return;
							end;
						end;
					v4 = {
							Flag = "AutoSpeed2x",
							Title = "Auto x2 Speed",
							Default = v5.MainTabConfig.AutoSpeed2x,
							Callback = callback_fn_2,
						};
					local v6 = v23:Toggle(v4);
					v1 = v6;
					local v7 = getgenv();
					v7.MainTabToggles.AutoSpeed2x = v6;
					v23.Space(v23);
					local v8 = getgenv();
					v5 = function(arg1, arg2, arg3, arg4, arg5, arg6)
							local callback_fn_10_ref_3_ref, callback_fn;
							local v0 = arg1;
							local message_2_ref = message_2;
							message_2();
							if arg1 then
								callback_fn = function(arg1, arg2, arg3, arg4, arg5)
										return;
									end;
								return;
							else
								callback_fn = getgenv();
								message_2_ref = callback_fn.MainTabConfig;
								callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
								callback_fn = v0;
								message_2_ref.AutoSpeed3x = v0;
								if v0 then
									callback_fn_10_ref_3_ref = getgenv();
									callback_fn = "AutoSpeed2x";
									if callback_fn_10_ref_3_ref.MainTabConfig.AutoSpeed2x then
										callback_fn = getgenv();
										callback_fn.MainTabConfig.AutoSpeed2x = false;
										if v1 then
											v1.Set(v1, false);
										end;
									end;
									callback_fn = function(arg1)
											local v0;
											v0.WaitForChild(v0, "RemoteFunctions");
											v0.InvokeServer(v0, unpack({ v0 }));
											return;
										end;
									pcall(callback_fn);
								end;
								return;
							end;
						end;
					v7 = {
							Flag = "AutoSpeed3x",
							Title = "Auto x3 Speed",
							Default = v8.MainTabConfig.AutoSpeed3x,
							Callback = v5,
						};
					v4 = v23:Toggle(v7);
					local v9 = getgenv();
					v9.MainTabToggles.AutoSpeed3x = v4;
					v23.Space(v23);
					local v10 = getgenv();
					v8 = function(arg1, arg2, arg3, arg4, arg5, arg6)
							local callback_fn;
							local v0 = arg1;
							message_2();
							local v1 = arg1;
							if arg1 then
								callback_fn = function(arg1, arg2)
										return;
									end;
								return;
							else
								callback_fn = v1();
								callback_fn[v1][v1] = v0;
								return;
							end;
						end;
					v9 = {
							Flag = "AutoPlayAgain",
							Title = "Auto Play Again",
							Default = v10.MainTabConfig.AutoPlayAgain,
							Callback = v8,
						};
					v7 = v23:Toggle(v9);
					local v11 = getgenv();
					v11.MainTabToggles.AutoPlayAgain = v7;
					v23.Space(v23);
					local v12 = getgenv();
					local callback_fn_3 = function(arg1)
							local callback_fn;
							message_2();
							local v0 = arg1;
							local v1 = arg1;
							if arg1 then
								callback_fn = function(arg1, arg2, arg3, arg4, arg5)
										return;
									end;
								return;
							else
								callback_fn = v1();
								callback_fn[v1][v1] = v0;
								return;
							end;
						end;
					v23.Toggle(v23, {
						Flag = "AutoReturn",
						Title = "Auto Return",
						Default = v12.MainTabConfig.AutoReturn,
						Callback = callback_fn_3,
					});
					local items = { Columns = 2 };
					v23.Space(v23, items);
					items = { Title = "Auto Select Difficulty", TextSize = 16, TextTransparency = .3 };
					v23.Section(v23, items);
					v23.Space(v23);
					local items_2 = {
							Easy = "dif_easy",
							Normal = "dif_normal",
							Hard = "dif_hard",
							Insane = "dif_insane",
							Impossible = "dif_impossible",
							Apocalypse = "dif_apocalypse",
						};
					local items_2_ref = items_2;
					v12 = { Title = "Easy" };
					local items_3 = { Title = "Normal" };
					local items_4 = { Title = "Insane" };
					local items_5 = { Title = "Impossible" };
					local items_6 = { Title = "Apocalypse" };
					callback_fn_3 = {
							v12,
							items_3,
							{ Title = "Hard" },
							items_4,
							items_5,
							items_6,
						};
					items_3 = function(arg1, arg2)
							local v0;
							local v1 = v0();
							v1[v0][v0] = arg1.Title;
							v1 = v0();
							v1[v0][v0] = items_2_ref[arg1.Title];
							local v2 = (getfenv and getfenv() or _ENV)[v0];
							return;
						end;
					v23.Dropdown(v23, {
						Flag = "SelectedDifficulty",
						Title = "Difficulty",
						Values = callback_fn_3,
						Callback = items_3,
					});
					v23.Space(v23);
					local flag = false;
					callback_fn_2 = function(arg1, arg2)
							local v0, callback_fn;
							while true do
								v0 = task.wait(.5);
								if not v0 then
									break;
								end;
								callback_fn = function(arg1, arg2, arg3)
										local game_gui = n3:FindFirstChild("GameGui");
										local game_gui_ref = game_gui;
										if game_gui then
											game_gui = game_gui_ref.Screen.Middle:FindFirstChild("GameEnd");
											if game_gui then
 
											end;
										end;
										return;
									end;
								pcall(callback_fn);
							end;
							return;
						end;
					task.spawn(callback_fn_2);
					items_5 = getgenv();
					items_4 = function(arg1)
							local n1, callback_fn_10_ref_3_ref, callback_fn;
							local v0 = arg1;
							message_2();
							if arg1 then
								callback_fn = function(arg1, arg2, arg3)
										return;
									end;
								return;
							else
								callback_fn = getgenv();
								callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
								n1 = 4086164178798;
								callback_fn.MainTabConfig.AutoDifficulty = v0;
								if v0 then
									n1 = getgenv();
									callback_fn_10_ref_3_ref = "SelectedDifficulty";
									if not n1.MainTabConfig.SelectedDifficulty then
										return;
									else
										flag = false;
										callback_fn_10_ref_3_ref = function(arg1)
												local v0, callback_fn;
												while true do
													v0 = getgenv();
													if not v0.MainTabConfig.AutoDifficulty then
														break;
													end;
													callback_fn = function(arg1, arg2, arg3, arg4, arg5)
															local v0 = not flag;
															local v1 = not flag;
															if not flag then
																getgenv();
															end;
															if v1 then
																v0 = function(arg1, arg2, arg3)
																		local v0;
																		getgenv();
																		v0.WaitForChild(v0, "RemoteFunctions");
																		v0.InvokeServer(v0, unpack({ v0 }));
																		return;
																	end;
																pcall(v0);
															end;
															return;
														end;
													pcall(callback_fn);
													task.wait(1);
												end;
												return;
											end;
										task.spawn(callback_fn_10_ref_3_ref);
										return;
									end;
								else
 
								end;
							end;
						end;
					callback_fn_2 = {
							Flag = "AutoDifficulty",
							Title = "Auto Difficulty",
							Default = items_5.MainTabConfig.AutoDifficulty,
							Callback = items_4,
						};
					callback_fn = v23:Toggle(callback_fn_2);
					v5 = getgenv();
					v5.MainTabToggles.AutoDifficulty = callback_fn;
					v5 = { Columns = 2 };
					v23.Space(v23, v5);
					v5 = { Title = "Auto Select Map", TextSize = 16, TextTransparency = .3 };
					v23.Section(v23, v5);
					v23.Space(v23);
					items_2 = {
							Garden = "map_farm",
							Jungle = "map_jungle",
							["Tropical Island"] = "map_island",
							["Toxic Facility"] = "map_toxic",
							["Back Garden"] = "map_back_garden",
							Dojo = "map_dojo",
							Graveyard = "map_graveyard",
							Space = "map_space",
						};
					local items_2_ref_2 = items_2;
					items_5 = { Title = "Garden" };
					items_6 = { Title = "Jungle" };
					local items_7 = { Title = "Tropical Island" };
					local items_8 = { Title = "Toxic Facility" };
					local items_9 = { Title = "Back Garden" };
					local items_10 = { Title = "Dojo" };
					local items_11 = { Title = "Graveyard" };
					local items_12 = { Title = "Space" };
					items_4 = {
							items_5,
							items_6,
							items_7,
							items_8,
							items_9,
							items_10,
							items_11,
							items_12,
						};
					items_6 = function(arg1)
							local v0;
							local v1 = v0();
							v1[v0][v0] = arg1.Title;
							v1 = v0();
							v1[v0][v0] = items_2_ref_2[arg1.Title];
							local v2 = (getfenv and getfenv() or _ENV)[v0];
							return;
						end;
					v8 = {
							Flag = "SelectedMap",
							Title = "Map",
							Values = items_4,
							Callback = items_6,
						};
					v23.Dropdown(v23, v8);
					v23.Space(v23);
					items_8 = getgenv();
					items_7 = function(arg1)
							local v0, callback_fn;
							if arg1 then
								v0 = getgenv();
								if not v0.MainTabConfig.SelectedMap then
									callback_fn = function(arg1, arg2, arg3, arg4)
											task.wait(.1);
											local v0 = getgenv();
											v0.MainTabConfig.AutoJoinMap = false;
											if v3 then
												v3.Set(v3, false);
											end;
											return;
										end;
									return;
								else
									message_2();
									r58 = function(arg1, arg2, arg3, arg4, arg5)
											task.wait(.1);
											local v0 = getgenv();
											v0.MainTabConfig.AutoJoinMap = false;
											if v3 then
												v3.Set(v3, false);
											end;
											return;
										end;
									return;
								end;
							else
								callback_fn = getgenv();
								callback_fn.MainTabConfig.AutoJoinMap = false;
							end;
						end;
					v10 = {
							Flag = "AutoJoinMap",
							Title = "Auto Join Map",
							Default = items_8.MainTabConfig.AutoJoinMap,
							Callback = items_7,
						};
					v23.Toggle(v23, v10);
					callback_fn_3 = { Columns = 2 };
					v23.Space(v23, callback_fn_3);
					callback_fn_3 = { Title = "Performance Mode", TextSize = 16, TextTransparency = .3 };
					v23.Section(v23, callback_fn_3);
					v23.Space(v23);
					items_9 = callback_fn_10_ref_3("", 18845112443463);
					items_11 = getgenv();
					items_10 = function(arg1, arg2, arg3, arg4)
							local v0 = getgenv();
							v0.PerformanceConfig.RenderStopped = arg1;
							game.GetService(game, "RunService");
							local callback_fn = function(arg1)
									return;
								end;
							pcall(callback_fn);
							if arg1 then
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Performance Mode ON", Content = "3D rendering disabled", Duration = 1 });
								print("[PERFORMANCE] \226\156\133 3D Rendering STOPPED!");
							else
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Performance Mode OFF", Content = "3D rendering enabled", Duration = 1 });
								print("[PERFORMANCE] \226\156\133 3D Rendering RESTORED!");
							end;
							return;
						end;
					callback_fn_3 = {
							Flag = "PerformanceMode",
							Title = "Disable 3D Render",
							Desc = v35_ref[items_9],
							Default = items_11.PerformanceConfig.RenderStopped,
							Callback = items_10,
						};
					v10 = v23:Toggle(callback_fn_3);
					callback_fn_3 = getgenv();
					callback_fn_3.PerformanceModeToggle = v10;
					v23.Space(v23);
					items_10 = callback_fn_10_ref_3("", 11384241165493);
					items_12 = getgenv();
					items_11 = function(arg1, arg2, arg3, arg4, arg5)
							local v0 = getgenv();
							v0.LowGraphicsConfig.Enabled = arg1;
							if arg1 then
								v32();
								v13();
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Low Graphics ON", Content = "Textures, effects, and decorations removed", Duration = 3 });
							else
								n2();
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Low Graphics OFF", Content = "Graphics restored to original", Duration = 2 });
							end;
							return;
						end;
					v12 = {
							Flag = "LowGraphicsMode",
							Title = "Low Graphics Mode",
							Desc = v35_ref[items_10],
							Default = items_12.LowGraphicsConfig.Enabled,
							Callback = items_11,
						};
					callback_fn_3 = v23:Toggle(v12);
					v12 = getgenv();
					v12.LowGraphicsToggle = callback_fn_3;
					v23.Space(v23);
					local v13 = getgenv();
					items_12 = function(arg1, arg2, arg3, arg4, arg5, arg6)
							local v0 = getgenv();
							v0.PerformanceConfig.BlackScreenEnabled = arg1;
							if arg1 then
								v12();
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Black Screen ON", Content = "Screen covered with black overlay", Duration = 1 });
								print("[BLACK SCREEN] \226\156\133 Enabled!");
							else
								callback_fn_10_ref();
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Black Screen OFF", Content = "Screen restored to normal", Duration = 1 });
								print("[BLACK SCREEN] \226\156\133 Disabled!");
							end;
							return;
						end;
					items_3 = {
							Flag = "BlackScreenMode",
							Title = "Black Screen",
							Desc = "Does not improve performance",
							Default = v13.PerformanceConfig.BlackScreenEnabled,
							Callback = items_12,
						};
					v12 = v23:Toggle(items_3);
					items_3 = getgenv();
					items_3.BlackScreenToggle = v12;
					v23.Space(v23);
					print("[MAIN TAB] Content loaded successfully!");
					return;
				end;
			task.spawn(items_3);
			game.GetService(game, "Workspace");
			game.GetService(game, "ReplicatedStorage");
			v3 = getgenv();
			items_8 = getgenv();
			v3.TestFailureSystem = items_8.TestFailureSystem;
			v3 = game:GetService("Workspace");
			v3_ref = v3;
			game.GetService(game, "ReplicatedStorage");
			v9 = getgenv();
			items_5 = getgenv();
			v9.GlobalTracking = items_5.GlobalTracking;
			v9 = function(arg1, arg2, arg3, arg4)
					local values, items, v0, values_2, v1, v35_ref_ref, v2, message, v1_ref, v1_ref_ref;
					for i = 1, 10, 1 do
						items = { arg1:GetDescendants() };
						values = { ipairs(unpack_fn(items)) };
						items = values[1];
						v0, values_2 = values[1](values[2], values[3]);
						if v0 then
							v35_ref_ref = v35_ref;
							message = "IntValue";
							v1 = values_2:IsA("IntValue");
							v1_ref = v1;
							if not v1 then
								v35_ref_ref = values_2:IsA("NumberValue");
								if not v35_ref_ref then
									values_2.IsA(values_2, "StringValue");
								end;
							end;
							v1_ref_ref = v1_ref;
							if v1_ref then
								message = string.lower(values_2.Name);
								string.find(message, "id");
							end;
							while not v1_ref_ref do
 
							end;
							return g77iRCBKzzXS4d;
						else
							values = { arg1:GetAttributes() };
							values_2 = { pairs(unpack_fn(values)) };
							items, values_2 = values_2[1](values_2[2], values_2[3]);
							if items then
								while true do
									v2 = string.lower(items);
									v1_ref_ref = string.find(v2, "id");
									if v1_ref_ref then
										break;
									end;
								end;
								return values_2;
							else
								task.wait(.2);
							end;
						end;
					end;
					return gw67cgJ7o3UK;
				end;
			v9_ref = v9;
			items_6 = function()
					local v0 = getgenv();
					local global_tracking_fn = v0.GlobalTracking;
					local message = "1\021\247\017v\180\029\164\028\150";
					v0 = v35_ref;
					local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
					local n1 = 34258228739664;
					local message_2 = "connection";
					local connection = global_tracking_fn.connection;
					if global_tracking_fn.connection then
						return;
					else
						message = "\'\146\188";
						v0 = v35_ref;
						callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
						n1 = 2272949093410;
						global_tracking_fn = v3_ref:FindFirstChild("Map");
						message_2 = global_tracking_fn;
						connection = not global_tracking_fn;
						if not global_tracking_fn then
							return;
						else
							callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							message = "\245\018/\221\132\183\145u";
							n1 = 6121363983138;
							global_tracking_fn = "Entities";
							connection = message_2:FindFirstChild("Entities");
							v0 = connection;
							connection = not connection;
							if not (not (not (not (not (not (not connection)))))) then
								return;
							else
								callback_fn_10_ref_3_ref = global_tracking_fn();
								callback_fn_10_ref_3_ref[global_tracking_fn][global_tracking_fn] = true;
								callback_fn_10_ref_3_ref = global_tracking_fn();
								connection = callback_fn_10_ref_3_ref[global_tracking_fn];
								callback_fn_10_ref_3_ref = {};
								connection[global_tracking_fn] = callback_fn_10_ref_3_ref;
								callback_fn_10_ref_3_ref = global_tracking_fn();
								message = function(arg1, arg2, arg3)
										local v0 = arg1;
										local v1 = getgenv();
										local message = "enabled";
										if v1.GlobalTracking.enabled then
											message = function(arg1, arg2, arg3, arg4)
													local text = "tE|\n";
													task.wait(1);
													local v0_ref = v0;
													local v0_ref_2 = v0;
													if v0 then
														if v0.Parent then
															string.find(v0.Name, "unit_");
														end;
													end;
													if v0_ref_2 then
														v0_ref_2 = v9_ref(v0);
														v0_ref = v0_ref_2;
														if v0_ref_2 then
															text = getgenv();
															table.insert(text.GlobalTracking.unitIDs, v0_ref);
															text = tostring(v0_ref);
															print("[GLOBAL TRACKING] Tracked unit ID: " .. text);
														end;
													end;
													return;
												end;
											task.spawn(message);
										end;
										return;
									end;
								n1 = v0.ChildAdded:Connect(message);
								callback_fn_10_ref_3_ref[global_tracking_fn][global_tracking_fn] = n1;
								return;
							end;
						end;
					end;
				end;
			items_9 = function(arg1, arg2, arg3, arg4, arg5)
					local v0, v1;
					local callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local v3_ref_ref = v3_ref;
							local v35_ref_ref = v35_ref;
							local message = "\025\185\135";
							local map = v3_ref:FindFirstChild("Map");
							local map_ref = map;
							if map then
								message = "\223\139\235\'\132x\175b";
								v3_ref_ref = map_ref:FindFirstChild("Entities");
								v35_ref_ref = v3_ref_ref;
								if v3_ref_ref then
									v3_ref_ref = pairs;
									message = { v35_ref_ref:GetChildren() };
									for key, value in pairs((unpack or table.unpack)(message)) do
										v3_ref_ref = value:IsA("Model");
										if v3_ref_ref then
											v3_ref_ref = value:GetAttribute("Owner");
											v3_ref_ref = v3_ref_ref == items_12_ref.UserId;
											if ((((((v3_ref_ref == items_12_ref.UserId) == items_12_ref.UserId) == items_12_ref.UserId) == items_12_ref.UserId) == items_12_ref.UserId) == items_12_ref.UserId) == items_12_ref.UserId then
												table.insert(v0, value);
											end;
										end;
									end;
								end;
							end;
							return;
						end;
					local v2 = (getfenv and getfenv() or _ENV)[v1];
					return yK7uTuSUMjeVw;
				end;
			v7 = function(arg1)
					local v0;
					local v1 = v0();
					local v2 = v1[v0];
					v1 = {};
					v2[v0] = v1;
					v2 = (getfenv and getfenv() or _ENV)[v0];
					return;
				end;
			items_6_ref = items_6;
			items_8 = function()
					local v0 = getgenv();
					v0.GlobalTracking.enabled = false;
					local v1 = getgenv();
					local global_tracking_fn = v1.GlobalTracking;
					v1 = v35_ref;
					v0 = "connection";
					if global_tracking_fn.connection then
						v1 = getgenv();
						v1.GlobalTracking.connection.Disconnect(v1.GlobalTracking.connection);
						v0 = getgenv();
						v0.GlobalTracking.connection = nil;
					end;
					v0 = global_tracking_fn();
					local v2 = v0[global_tracking_fn];
					v0 = {};
					v2[global_tracking_fn] = v0;
					return;
				end;
			callback_fn_3 = function(arg1, arg2, arg3, arg4, arg5)
					local v0;
					math.random();
					math.random();
					CFrame.new(v0.X, v0.Y, v0.Z, .70710682868958, 0, .70710676908493, 0, 1, 0, -0.70710682868958, 0, .70710676908493);
					return jP2V2EThEO3sJO;
				end;
			v7_ref = v7;
			r57 = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
					local v0, callback_fn, values;
					arg3 = arg3 or 10;
					local v1 = arg3 or 10 or 10 or 10 or 10 or 10 or 10;
					local n1 = 1;
					local n2 = 1;
					local flag = false;
					local n3 = 0;
					while true do
						n3 = n3 + n1;
						n2 = 12889225;
						if not (flag and ((((((n3 + n1) + n1) + n1) + n1) + n1) + n1) + n1 >= v1 or not flag and ((((((n3 + n1) + n1) + n1) + n1) + n1) + n1) + n1 <= v1) then
							break;
						end;
						while true do
							n2 = n3;
							v0 = items_7_ref();
							if v0 then
								break;
							end;
							arg1();
							callback_fn = function(arg1)
									local args;
									args.WaitForChild(args, "PlaceUnit");
									return (unpack or table.unpack)(args);
								end;
							values = { pcall(callback_fn) };
							while not values[1] do
								task.wait(.05);
							end;
							print("[DOJO] \226\156\147 Placed " .. (arg2  .. (" on attempt " .. n2)));
							return true;
						end;
						warn("[DOJO] Game ended - stopping plant attempts");
						return false;
					end;
					warn("[DOJO] \226\157\140 FAILED to plant " .. (arg2  .. (" after " .. (arg3  .. " attempts!"))));
					return false;
				end;
			v11 = function(arg1, arg2, arg3, arg4, arg5, arg6)
					local args;
					local v0 = getgenv();
					local v1 = math.random();
					local v2 = math.random();
					CFrame.new(((v1 - .5) * 2) * (v0.AntiBanConfig.PlacementOffset or 1.5 or 1.5 or 1.5), 0, ((v2 - .5) * 2) * (v0.AntiBanConfig.PlacementOffset or 1.5 or 1.5 or 1.5));
					local callback_fn = function(arg1, arg2, arg3)
							local args;
							args.WaitForChild(args, "PlaceUnit");
							local items = { unpack(args) };
							return (unpack or table.unpack)(args);
						end;
					local v3 = pcall(callback_fn);
					if pcall(callback_fn) then
 
					end;
					return v3;
				end;
			items_8_ref = items_8;
			callback_fn_5 = function(arg1, arg2, arg3)
					local v0;
					math.random();
					math.random();
					CFrame.new(v0.X, v0.Y, v0.Z, .70710682868958, 0, -0.70710676908493, 0, 1, 0, .70710682868958, 0, .70710676908493);
					return X54Ua5orkLte1U;
				end;
			items_8 = function(arg1)
					local callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local game_gui = n3:FindFirstChild("GameGui");
							local game_gui_ref = game_gui;
							if game_gui then
								game_gui = game_gui_ref.Screen.Middle:FindFirstChild("GameEnd");
								game_gui = game_gui;
								if game_gui then
									return gxLR0dDURKnt;
								else
									return nil;
								end;
							end;
						end;
					local v0 = pcall(callback_fn);
					if pcall(callback_fn) then
 
					end;
					return v0;
				end;
			items_5 = function(arg1, arg2, arg3, arg4)
					local v0;
					items_12_ref.GetAttribute(items_12_ref, "Cash");
					return v0;
				end;
			items_5_ref = items_5;
			items_4 = function(arg1)
					local v0 = arg1;
					if not arg1 then
						return LQODgrzk68WWU;
					else
						r83 = function(arg1, arg2)
								local v0;
								v0.WaitForChild(v0, "UpgradeUnit");
								local items = { unpack({ v0 }) };
								return;
							end;
						return v0;
					end;
				end;
			v11_ref = v11;
			items_7 = function(arg1, arg2, arg3, arg4, arg5)
					local callback_fn = function()
							local game_gui = n3:FindFirstChild("GameGui");
							local game_gui_ref = game_gui;
							if game_gui then
								game_gui = game_gui_ref.Screen.Middle:FindFirstChild("GameEnd");
								game_gui = game_gui;
								if game_gui then
									return uD9u2l82Lhm6z3;
								else
									return nil;
								end;
							end;
						end;
					local v0 = pcall(callback_fn);
					if pcall(callback_fn) then
 
					end;
					return v0;
				end;
			items_4_ref = items_4;
			items_4 = function(arg1, arg2, arg3, arg4, arg5)
					local v0 = arg1;
					if not arg1 then
						return XuWOVC62U2AwlE;
					else
						r83 = function(arg1)
								local v0;
								v0.WaitForChild(v0, "SellUnit");
								local items = { unpack({ v0 }) };
								return;
							end;
						pc = (getfenv and getfenv() or _ENV)[v0];
						return v0;
					end;
				end;
			items_7_ref = items_7;
			r20 = function()
					print("[AUTO WIN V1] Starting Tomato Plant strategy...");
					local v0 = getgenv();
					local unit_i_ds = v0.GlobalTracking.unitIDs;
					local v1 = CFrame.new(-326.81658935547, 61.680305480957, -105.29479980469, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local items = { cframe = v1, rotation = 180 };
					local v2 = CFrame.new(-326.57305908203, 61.680305480957, -110.16496276855, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v0 = { cframe = v2, rotation = 180 };
					local v3 = CFrame.new(-340.45227050781, 61.680305480957, -102.63774108887, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local items_2 = { cframe = v3, rotation = 180 };
					local v4 = CFrame.new(-341.37030029297, 61.680305480957, -108.40327453613, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v1 = { cframe = v4, rotation = 180 };
					local v5 = CFrame.new(-330.56582641602, 61.680305480957, -107.22344970703, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v2 = { cframe = v5, rotation = 180 };
					local v6 = CFrame.new(-331.06506347656, 61.680305480957, -112.37507629395, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v3 = { cframe = v6, rotation = 180 };
					local v7 = CFrame.new(-325.50054931641, 61.680305480957, -114.86784362793, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v4 = { cframe = v7, rotation = 180 };
					local v8 = CFrame.new(-340.13137817383, 61.680305480957, -112.30937194824, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v5 = { cframe = v8, rotation = 180 };
					local v9 = CFrame.new(-330.98281860352, 61.680305480957, -115.9708480835, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v6 = { cframe = v9, rotation = 180 };
					local v10 = CFrame.new(-345.53015136719, 61.680305480957, -105.17726135254, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v7 = { cframe = v10, rotation = 180 };
					local v11 = CFrame.new(-341.28771972656, 61.680305480957, -116.7790222168, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v8 = { cframe = v11, rotation = 180 };
					local v12 = CFrame.new(-345.55413818359, 61.680305480957, -111.35703277588, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v9 = { cframe = v12, rotation = 180 };
					local v13 = CFrame.new(-327.55017089844, 61.680305480957, -118.89196014404, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v10 = { cframe = v13, rotation = 180 };
					local v14 = CFrame.new(-339.93948364258, 61.680305480957, -120.87809753418, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v11 = { cframe = v14, rotation = 180 };
					local v15 = CFrame.new(-345.09106445312, 61.680305480957, -118.65930938721, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v12 = { cframe = v15, rotation = 180 };
					local v16 = CFrame.new(-331.58581542969, 61.68030166626, -121.9854888916, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v13 = { cframe = v16, rotation = 180 };
					local v17 = CFrame.new(-340.29302978516, 61.680305480957, -124.85790252686, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v14 = { cframe = v17, rotation = 180 };
					v16 = "cframe";
					local v18 = CFrame.new(-329.31811523438, 61.680305480957, -125.80452728271, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local n1 = 23921648348035;
					v17 = "rotation";
					v15 = { cframe = v18, rotation = 180 };
					local items_3 = {
							items,
							v0,
							items_2,
							v1,
							v2,
							v3,
							v4,
							v5,
							v6,
							v7,
							v8,
							v9,
							v10,
							v11,
							v12,
							v13,
							v14,
							v15,
						};
					v0 = items_3;
					items_3 = {
							125,
							175,
							350,
							500,
						};
					items_2 = items_3;
					items_3 = {};
					v1 = items_3;
					items = 1;
					for i = 1, #v0, 1 do
						while true do
							v6 = i;
							items = items_7_ref();
							if items then
								break;
							end;
							v15 = 10174543598209;
							v14 = "(\248(&\151\140";
							v10 = "/18...";
							print("[AUTO WIN V1] Planting Tomato " .. (v6  .. "/18..."));
							v7 = items_5_ref();
							items = 100;
							if v7 < 100 then
								while true do
									items = items_7_ref();
									if items then
										break;
									end;
									task.wait(.2);
								end;
								return DjO9o1HbElsJRj;
							else
								items = 1;
								v10 = false;
								for i = 1, 10, 1 do
									while true do
										items = v11_ref("unit_tomato_plant", v0[v6].cframe, v0[v6].rotation);
										if items then
											break;
										end;
										task.wait(.05);
									end;
									v14 = v35_ref;
									v15 = callback_fn_10_ref_3;
									v18 = 7910127816291;
									v17 = "\002\196\000\157\194\144\169\211\181\143\001 Y\167Z>\018\204Cy(<\000\028\249H\236aY\152\199\234";
									v16 = 7910127816291;
									print("[AUTO WIN V1] \226\156\147 Placed Tomato " .. v6);
									task.wait(.15);
									v10 = #unit_i_ds;
									items = #unit_i_ds < v6;
									if #unit_i_ds < v6 then
										while true do
											items = items_7_ref();
											if items then
												break;
											end;
											task.wait(.2);
										end;
										return OgOg1MVM8FTx;
									else
										while not (#unit_i_ds < v6) do
											v1[v6] = unit_i_ds[v6];
											v15 = " (ID: ";
											v18 = tostring(unit_i_ds[v6]);
											n1 = 24596456615101;
											v17 = ")";
											v16 = v18  .. ")";
											print("[AUTO WIN V1] \226\156\147 Tracked Tomato " .. (v6  .. (" (ID: " .. (v18  .. ")"))));
											v10 = 2;
											v14 = 15386709;
											items = 2516939;
											while true do
												v14 = v10;
												v15 = items_7_ref();
												if v15 then
													break;
												end;
												n1 = " to Level ";
												print("[AUTO WIN V1] Upgrading Tomato " .. (v6  .. (" to Level " .. (v14  .. "..."))));
												v16 = items_5_ref;
												v17 = items_5_ref();
												items = v17 < items_2[v14 - 1];
												if v17 < items_2[v14 - 1] then
													while true do
														v16 = items_7_ref();
														if v16 then
															break;
														end;
														task.wait(.2);
													end;
													return items;
												else
													v17 = function(arg1)
															local v0;
															v0.WaitForChild(v0, "UpgradeUnit");
															local _0l_nsd_fz_z0bui = (getfenv and getfenv() or _ENV)["0lNSDFzZ0Bui"];
															return;
														end;
													pcall(v17);
													n1 = math.random();
													task.wait(.28 + n1 * .27);
												end;
											end;
											return items;
										end;
										items("[AUTO WIN V1] \226\157\140 Failed to track Tomato " .. v6);
										return items;
									end;
								end;
							end;
						end;
						return fstPMwlm6JsQrl;
					end;
					return znzNkXgfSPlQ;
				end;
			v14 = function(arg1, arg2, arg3, arg4, arg5, arg6)
					local v0, items_5_ref_ref, v1;
					local v2 = tick();
					local v2_ref = v2;
					arg2 = arg2 or 30;
					while true do
						items_5_ref_ref = items_5_ref;
						v0 = items_5_ref();
						if not (v0 < arg1) then
							break;
						end;
						while true do
							items_5_ref_ref = items_7_ref();
							if items_5_ref_ref then
								break;
							end;
							while true do
								v1 = tick();
								if v1 - v2_ref > arg2 then
									break;
								end;
								task.wait(.2);
							end;
							warn("[WAIT MONEY] Timeout waiting for $" .. arg1);
							return false;
						end;
						warn("[WAIT MONEY] Game ended - stopping wait");
						return false;
					end;
					return true;
				end;
			v15 = function(arg1, arg2, arg3, arg4)
					local v0, n1, v35_ref_ref, callback_fn_10_ref_3_ref, v1, n2;
					local v2 = arg1;
					if not arg1 then
						return NNoQx8KbXLlM;
					else
						v35_ref_ref = v35_ref;
						n2 = 6085571857169;
						callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
						v1 = v2:GetAttribute("Level");
						n1 = 1;
						v0 = v1 or 1;
						v1 = v1 or 1;
						while true do
							v0 = v1 < arg2;
							if not (v1 < arg2) then
								break;
							end;
							while true do
								v35_ref_ref = 1;
								n1 = arg3[v1 + 1];
								v0 = not arg3[v1 + 1];
								if not (not arg3[v1 + 1]) then
									break;
								end;
								while true do
									v35_ref_ref = v14_ref;
									callback_fn_10_ref_3_ref = v14_ref(n1, 30);
									if not callback_fn_10_ref_3_ref then
										break;
									end;
									while true do
										v35_ref_ref = items_4_ref(v2);
										if not v35_ref_ref then
											break;
										end;
										task.wait(.2);
										v2:GetAttribute("Level");
										n2 = math.random(11, 25);
										task.wait(n2 / 100);
									end;
									warn("[UPGRADE] Failed to upgrade to level " .. v1 + 1);
									return false;
								end;
								v0("[UPGRADE] Timeout waiting for $" .. n1);
								return v0;
							end;
							v0("[UPGRADE] No cost defined for level " .. v1 + 1);
							return v0;
						end;
						return true;
					end;
				end;
			v20 = function(arg1, arg2, arg3)
					print("[GRAVEYARD V2] Starting optimized Multi-Unit strategy...");
					local v0 = getgenv();
					local unit_i_ds = v0.GlobalTracking.unitIDs;
					local callback_fn = function(arg1, arg2, arg3)
							local n1 = 1;
							for i = 1, 50, 1 do
								while true do
									n1 = items_7_ref();
									if n1 then
										break;
									end;
									while true do
										n1 = v11_ref(arg1, arg2.cframe, arg2.rotation);
										if n1 then
											break;
										end;
										task.wait(.05);
									end;
									getgenv();
									return wVJevKjN5JE77h;
								end;
								return QsNCH7KP45kEi;
							end;
							return bQlpyg1HoX7A2;
						end;
					v0 = callback_fn;
					callback_fn = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
							local v0, v1, v2;
							arg5 = arg5 or 1;
							local v3 = (arg5 or 1 or 1 or 1 or 1 or 1 or 1) + 1;
							for i = (((arg5 or 1 or 1 or 1 or 1 or 1 or 1 or 1) + 1) - 1) + 1, arg2, 1 do
								while true do
									v3 = i;
									v0 = items_7_ref();
									if v0 then
										break;
									end;
									while true do
										v0 = arg3[v3 - 1];
										if not arg3[v3 - 1] then
											break;
										end;
										while true do
											print("[GRAVEYARD V2] Upgrading " .. (arg4  .. (" to Level " .. (v3  .. (" (cost: $" .. (v0  .. ")..."))))));
											v1 = v14_ref(v0, 30);
											if not v1 then
												break;
											end;
											v1 = function(arg1, arg2, arg3, arg4, arg5)
													local v0;
													v0.WaitForChild(v0, "UpgradeUnit");
													return;
												end;
											pcall(v1);
											v2 = math.random();
											task.wait(.08 + v2 * .21);
										end;
										warn("[GRAVEYARD V2] Failed to get money for " .. (arg4  .. (" Level " .. v3)));
										return false;
									end;
									warn("[GRAVEYARD V2] No cost for level " .. (v3  .. (" of " .. arg4)));
									return false;
								end;
								warn("[UPGRADE] Game ended - stopping upgrades for " .. arg4);
								return false;
							end;
							print("[GRAVEYARD V2] \226\156\147 " .. (arg4  .. (" upgraded to Level " .. arg2)));
							return true;
						end;
					local callback_fn_ref = callback_fn;
					local v1 = CFrame.new(-346.64068603516, 61.680305480957, -710.32055664062, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local items = { cframe = v1, rotation = 180 };
					local v2 = CFrame.new(-325.69024658203, 61.680305480957, -719.09197998047, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local items_2 = { cframe = v2, rotation = 180 };
					local v3 = CFrame.new(-321.40118408203, 61.680309295654, -718.98583984375, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v4 = CFrame.new(-324.66149902344, 61.680305480957, -712.49975585938, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local items_3 = { cframe = v4, rotation = 180 };
					local v5 = CFrame.new(-330.85034179688, 61.68030166626, -708.56018066406, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v6 = CFrame.new(-327.02313232422, 61.680309295654, -706.68493652344, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v7 = CFrame.new(-331.06216430664, 61.680305480957, -703.84161376953, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v8 = CFrame.new(-333.68597412109, 61.680309295654, -716.25994873047, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v9 = CFrame.new(-335.74871826172, 61.680305480957, -719.666015625, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v10 = CFrame.new(-330.1884765625, 61.68030166626, -719.81481933594, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v11 = CFrame.new(-331.47357177734, 61.680309295654, -713.38330078125, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v12 = CFrame.new(-336.26654052734, 61.68030166626, -712.67547607422, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v13 = CFrame.new(-340.38153076172, 61.680309295654, -718.15502929688, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v14 = CFrame.new(-340.40176391602, 61.680305480957, -704.43621826172, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v15 = CFrame.new(-337.24542236328, 61.680305480957, -714.52600097656, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v16 = CFrame.new(-345.22451782227, 61.680305480957, -709.48126220703, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v17 = CFrame.new(-348.20434570312, 61.680305480957, -712.92510986328, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v18 = CFrame.new(-347.61895751953, 61.680309295654, -705.25695800781, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					callback_fn = {
							frozenpike1 = items,
							dragon1 = items_2,
							dragon2 = { cframe = v3, rotation = 180 },
							dragon3 = items_3,
							witch1 = { cframe = v5, rotation = 180 },
							witch2 = { cframe = v6, rotation = 180 },
							witch3 = { cframe = v7, rotation = 180 },
							potato1 = { cframe = v8, rotation = 180 },
							potato2 = { cframe = v9, rotation = 180 },
							potato3 = { cframe = v10, rotation = 180 },
							christmasbell1 = { cframe = v11, rotation = 180 },
							corrupted1 = { cframe = v12, rotation = 180 },
							corrupted2 = { cframe = v13, rotation = 180 },
							pinkrose1 = { cframe = v14, rotation = 180 },
							pinkrose2 = { cframe = v15, rotation = 180 },
							frozenpike2 = { cframe = v16, rotation = 180 },
							frozenpike3 = { cframe = v17, rotation = 180 },
							frozenpike4 = { cframe = v18, rotation = 180 },
						};
					items = callback_fn;
					local items_4 = {
							400,
							650,
							800,
							23000,
						};
					v1 = {
							4000,
							8750,
							18000,
							30500,
						};
					v2 = {
							4000,
							7000,
							10000,
							14000,
						};
					v3 = {
							6000,
							9000,
							14000,
							40000,
						};
					v4 = {
							9000,
							17000,
							25000,
							35000,
						};
					v5 = {
							8000,
							12500,
							26000,
							35000,
						};
					v6 = {
							9000,
							15750,
							32000,
							53500,
						};
					callback_fn = {
							frozenpike = items_4,
							christmasbell = v1,
							pinkrose = v2,
							potato = v3,
							witch = v4,
							dragon = v5,
							corrupted = v6,
						};
					items_4 = callback_fn;
					items_2 = "[GRAVEYARD V2] ========== PASO 1: FROZEN SPIKE 1 \226\134\146 LVL 4 ==========";
					print("[GRAVEYARD V2] ========== PASO 1: FROZEN SPIKE 1 \226\134\146 LVL 4 ==========");
					while true do
						items_2 = items_5_ref();
						if not (items_2 < 300) then
							break;
						end;
						task.wait(.2);
					end;
					items_2 = "unit_frozen_spike";
					items_3 = callback_fn_10_ref_3;
					v3 = 16175234997612;
					local v19 = v0("unit_frozen_spike", items.frozenpike1, "Frozen Spike 1");
					if not v19 then
						return W4C9ex0wpL5nte;
					else
						task.wait(.15);
						while #unit_i_ds < 1 do
							task.wait(.2);
						end;
						items_3 = "m\191hN\136\167\129\139\163\217gG_j\180\180\\\149\210\233eM//\213\208\130\221\005\\?gN\234\008\016S-\015\008\02290\224\016\rN<\205\224\025\222t\184n*\194QIde\189\130\238\145\219\007\174";
						callback_fn_ref(unit_i_ds[1], 4, items_4.frozenpike, "Frozen Spike 1");
						v3 = 14222218418654;
						print("[GRAVEYARD V2] ========== PASO 2: 3 DRAGONS (SIN UPGRADE) ==========");
						v19 = 1;
						for i = 1, 3, 1 do
							items_3 = i;
							while true do
								v3 = items_5_ref();
								if not (v3 < 6000) then
									break;
								end;
								task.wait(.2);
							end;
							while true do
								v19 = v0("unit_golem_dragon", items["dragon" .. items_3], "Dragon " .. items_3);
								if not v19 then
									break;
								end;
								task.wait(.15);
							end;
							return WGV0xf4ys7ms8P;
						end;
						while #unit_i_ds < 4 do
							task.wait(.2);
						end;
						items_2 = "[GRAVEYARD V2] ========== PASO 3: WITCH 1 (SIN UPGRADE) ==========";
						print("[GRAVEYARD V2] ========== PASO 3: WITCH 1 (SIN UPGRADE) ==========");
						while true do
							items_2 = items_5_ref();
							if not (items_2 < 4500) then
								break;
							end;
							task.wait(.2);
						end;
						items_2 = "unit_witch";
						items_3 = callback_fn_10_ref_3;
						v3 = 15602803629153;
						v19 = v0("unit_witch", items.witch1, "Witch 1");
						if not v19 then
							return JOm6wMY5kaJk;
						else
							task.wait(.15);
							while #unit_i_ds < 5 do
								task.wait(.2);
							end;
							items_2 = "[GRAVEYARD V2] ========== PASO 4: POTATOES UNO POR UNO ==========";
							print("[GRAVEYARD V2] ========== PASO 4: POTATOES UNO POR UNO ==========");
							while true do
								items_2 = items_5_ref();
								if not (items_2 < 4500) then
									break;
								end;
								task.wait(.2);
							end;
							items_2 = "unit_punch_potato";
							items_3 = callback_fn_10_ref_3;
							v3 = 11483290653923;
							v19 = v0("unit_punch_potato", items.potato1, "Potato 1");
							if not v19 then
								return Ps6IpMTqfVJC;
							else
								task.wait(.15);
								while #unit_i_ds < 6 do
									task.wait(.2);
								end;
								items_2 = 5;
								callback_fn_ref(unit_i_ds[6], 5, items_4.potato, "Potato 1");
								while true do
									items_2 = items_5_ref();
									if not (items_2 < 4500) then
										break;
									end;
									task.wait(.2);
								end;
								items_2 = "unit_punch_potato";
								items_3 = callback_fn_10_ref_3;
								v3 = 16282761715102;
								v19 = v0("unit_punch_potato", items.potato2, "Potato 2");
								if not v19 then
									return PVzXvm2vJ6632;
								else
									task.wait(.15);
									while #unit_i_ds < 7 do
										task.wait(.2);
									end;
									items_2 = 5;
									callback_fn_ref(unit_i_ds[7], 5, items_4.potato, "Potato 2");
									while true do
										items_2 = items_5_ref();
										if not (items_2 < 4500) then
											break;
										end;
										task.wait(.2);
									end;
									items_2 = "unit_punch_potato";
									items_3 = callback_fn_10_ref_3;
									v3 = 32622553660247;
									v19 = v0("unit_punch_potato", items.potato3, "Potato 3");
									if not v19 then
										return nil;
									else
										task.wait(.15);
										while #unit_i_ds < 8 do
											task.wait(.2);
										end;
										callback_fn_ref(unit_i_ds[8], 5, items_4.potato, "Potato 3");
										print("[GRAVEYARD V2] ========== PASO 5: WITCH 1 \226\134\146 LVL 5 ==========");
										callback_fn_ref(unit_i_ds[5], 5, items_4.witch, "Witch 1", 1);
										items_2 = "[GRAVEYARD V2] ========== PASO 6: CHRISTMAS BELL ==========";
										print("[GRAVEYARD V2] ========== PASO 6: CHRISTMAS BELL ==========");
										while true do
											items_2 = items_5_ref();
											if not (items_2 < 1600) then
												break;
											end;
											task.wait(.2);
										end;
										items_2 = "unit_christmas_bell";
										items_3 = callback_fn_10_ref_3;
										v3 = 27202592715131;
										v19 = v0("unit_christmas_bell", items.christmasbell1, "Christmas Bell 1");
										if not v19 then
											return nil;
										else
											task.wait(.15);
											while #unit_i_ds < 9 do
												task.wait(.2);
											end;
											callback_fn_ref(unit_i_ds[9], 5, items_4.christmasbell, "Christmas Bell 1");
											print("[GRAVEYARD V2] ========== PASO 7: UPGRADING ALL DRAGONS ==========");
											callback_fn_ref(unit_i_ds[2], 5, items_4.dragon, "Dragon 1");
											callback_fn_ref(unit_i_ds[3], 5, items_4.dragon, "Dragon 2");
											callback_fn_ref(unit_i_ds[4], 5, items_4.dragon, "Dragon 3");
											items_2 = "[GRAVEYARD V2] ========== PASO 8: WITCH 2 ==========";
											print("[GRAVEYARD V2] ========== PASO 8: WITCH 2 ==========");
											while true do
												items_2 = items_5_ref();
												if not (items_2 < 4500) then
													break;
												end;
												task.wait(.2);
											end;
											items_2 = "unit_witch";
											items_3 = callback_fn_10_ref_3;
											v3 = 16369051131334;
											v19 = v0("unit_witch", items.witch2, "Witch 2");
											if not v19 then
												return nil;
											else
												task.wait(.15);
												while #unit_i_ds < 10 do
													task.wait(.2);
												end;
												callback_fn_ref(unit_i_ds[10], 5, items_4.witch, "Witch 2");
												items_2 = "[GRAVEYARD V2] ========== PASO 9: WITCH 3 ==========";
												print("[GRAVEYARD V2] ========== PASO 9: WITCH 3 ==========");
												while true do
													items_2 = items_5_ref();
													if not (items_2 < 4500) then
														break;
													end;
													task.wait(.2);
												end;
												items_2 = "unit_witch";
												items_3 = callback_fn_10_ref_3;
												v3 = 33042860997658;
												v19 = v0("unit_witch", items.witch3, "Witch 3");
												if not v19 then
													return QZtatNN0ECvcKu;
												else
													task.wait(.15);
													while #unit_i_ds < 11 do
														task.wait(.2);
													end;
													callback_fn_ref(unit_i_ds[11], 5, items_4.witch, "Witch 3");
													print("[GRAVEYARD V2] ========== PASO 10: FROZEN SPIKE 1 \226\134\146 LVL 5 ==========");
													callback_fn_ref(unit_i_ds[1], 5, items_4.frozenpike, "Frozen Spike 1", 4);
													items_2 = "[GRAVEYARD V2] ========== PASO 11: PINK ROSES ==========";
													print("[GRAVEYARD V2] ========== PASO 11: PINK ROSES ==========");
													while true do
														items_2 = items_5_ref();
														if not (items_2 < 2000) then
															break;
														end;
														task.wait(.2);
													end;
													items_2 = "unit_pink_rose";
													items_3 = callback_fn_10_ref_3;
													v3 = 508907520236;
													v19 = v0("unit_pink_rose", items.pinkrose1, "Pink Rose 1");
													if not v19 then
														return ig9uSgxWGrYMox;
													else
														task.wait(.15);
														while #unit_i_ds < 12 do
															task.wait(.2);
														end;
														items_2 = 5;
														callback_fn_ref(unit_i_ds[12], 5, items_4.pinkrose, "Pink Rose 1");
														while true do
															items_2 = items_5_ref();
															if not (items_2 < 2000) then
																break;
															end;
															task.wait(.2);
														end;
														items_2 = "unit_pink_rose";
														items_3 = callback_fn_10_ref_3;
														v3 = 33717222522196;
														v19 = v0("unit_pink_rose", items.pinkrose2, "Pink Rose 2");
														if not v19 then
															return FJG2HtCndqblD;
														else
															task.wait(.15);
															while #unit_i_ds < 13 do
																task.wait(.2);
															end;
															callback_fn_ref(unit_i_ds[13], 5, items_4.pinkrose, "Pink Rose 2");
															items_2 = "[GRAVEYARD V2] ========== PASO 12: CORRUPTED 1 Y 2 ==========";
															print("[GRAVEYARD V2] ========== PASO 12: CORRUPTED 1 Y 2 ==========");
															while true do
																items_2 = items_5_ref();
																if not (items_2 < 8666) then
																	break;
																end;
																task.wait(.2);
															end;
															items_2 = "unit_eyeball";
															items_3 = callback_fn_10_ref_3;
															v3 = 32636771629917;
															v19 = v0("unit_eyeball", items.corrupted1, "Corrupted 1");
															if not v19 then
																return C6KsQ1zwb7LwNb;
															else
																task.wait(.15);
																while #unit_i_ds < 14 do
																	task.wait(.2);
																end;
																items_2 = 5;
																callback_fn_ref(unit_i_ds[14], 5, items_4.corrupted, "Corrupted 1");
																while true do
																	items_2 = items_5_ref();
																	if not (items_2 < 8666) then
																		break;
																	end;
																	task.wait(.2);
																end;
																items_3 = callback_fn_10_ref_3;
																v3 = 12814662833999;
																v19 = v0("unit_eyeball", items.corrupted2, "Corrupted 2");
																if not v19 then
																	return fjw41iKC4FRtrz;
																else
																	task.wait(.15);
																	while #unit_i_ds < 15 do
																		task.wait(.2);
																	end;
																	callback_fn_ref(unit_i_ds[15], 5, items_4.corrupted, "Corrupted 2");
																	v3 = 9756952220095;
																	items_3 = "n\139\173\192\005\127\178\022\229\205\001\150\247\029\213\149\180\180\161V\144cC\001\167\r\253w\rz\159\152XR \236\171-\028\162\203\206;\r\212\246\134\026\131\132zT\220n\136\129@\213\223s\155{^\241\237\133R\000/";
																	print("[GRAVEYARD V2] ========== PASO 13: FROZEN SPIKES RESTANTES ==========");
																	v19 = 2;
																	for i = 2, 4, 1 do
																		items_3 = i;
																		while true do
																			v3 = items_5_ref();
																			if not (v3 < 300) then
																				break;
																			end;
																			task.wait(.2);
																		end;
																		while true do
																			v19 = v0("unit_frozen_spike", items["frozenpike" .. items_3], "Frozen Spike " .. items_3);
																			if not v19 then
																				break;
																			end;
																			task.wait(.15);
																			while #unit_i_ds < (15 + items_3) - 1 do
																				task.wait(.2);
																			end;
																			callback_fn_ref(unit_i_ds[(15 + items_3) - 1], 5, items_4.frozenpike, "Frozen Spike " .. items_3);
																		end;
																		return xyCIM0N24G9A;
																	end;
																	return nil;
																end;
															end;
														end;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			v14_ref = v14;
			v16 = function(arg1, arg2)
					print("[SPACE V1] Starting Multi-Unit strategy...");
					local v0 = getgenv();
					local unit_i_ds = v0.GlobalTracking.unitIDs;
					local callback_fn = function(arg1, arg2, arg3)
							local game_gui, v35_ref_ref, n1, n2, n3, n4, n5;
							local v0 = nil;
							local flag = true;
							while true do
								v35_ref_ref = v35_ref;
								n1 = 33247326813305;
								n2 = 33247326813305;
								game_gui = n3:FindFirstChild("GameGui");
								flag = game_gui;
								if game_gui then
									n2 = v35_ref;
									n3 = 6819424177255;
									n1 = 6819424177255;
									v35_ref_ref = n3.GameGui:FindFirstChild("Screen");
									if v35_ref_ref then
										n5 = 7693874630142;
										n1 = v35_ref;
										n3 = 7693874630142;
										n2 = n3.GameGui.Screen:FindFirstChild("Bottom");
										if n2 then
											n3 = v35_ref;
											n5 = 15326580726752;
											n1 = n3.GameGui.Screen.Bottom:FindFirstChild("UnitViewer");
											if n1 then
												n5 = v35_ref;
												n3 = n3.GameGui.Screen.Bottom.UnitViewer:FindFirstChild("Frame");
												if n3 then
													n5 = n3.GameGui.Screen.Bottom.UnitViewer.Frame:FindFirstChild("Right");
													if n5 then
														n3.GameGui.Screen.Bottom.UnitViewer.Frame.Right.FindFirstChild(n3.GameGui.Screen.Bottom.UnitViewer.Frame.Right, "Target");
													end;
												end;
											end;
										end;
									end;
								end;
								if not flag then
									task.wait(.05);
								end;
							end;
							if not v0 then
								warn("[TARGET] Target button not found after 1s - skipping");
								return false;
							else
								n4 = 4709024106640;
								game_gui = getconnections(v0.MouseButton1Click);
								game_gui = game_gui;
								if game_gui then
									for i = 1, 4, 1 do
										task.wait(.05);
										n4 = function(arg1, arg2, arg3, arg4)
												return;
											end;
										pcall(n4);
									end;
									print("[TARGET] \226\156\133 Set to Strongest");
									return true;
								else
									warn("[TARGET] No connections found - skipping");
									return false;
								end;
							end;
						end;
					v0 = callback_fn;
					callback_fn = function(arg1, arg2, arg3, arg4)
							local n1 = 1;
							for i = 1, 50, 1 do
								while true do
									n1 = items_7_ref();
									if n1 then
										break;
									end;
									while true do
										n1 = v11_ref(arg1, arg2, arg3);
										if n1 then
											break;
										end;
										task.wait(.05);
									end;
									return nil;
								end;
								return X9g9EXIPB5xzQp;
							end;
							return ls8X7YxXmHrMNM;
						end;
					local callback_fn_ref = callback_fn;
					callback_fn = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
							local v0, v1, v2, v3;
							local n1 = 2;
							for i = 2, arg2, 1 do
								while true do
									v0 = i;
									n1 = items_7_ref();
									if n1 then
										break;
									end;
									while true do
										v1 = arg3[v0 - 1];
										if not (not arg3[v0 - 1]) then
											break;
										end;
										while true do
											print("[SPACE V1] Upgrading " .. (arg4  .. (" to Level " .. (v0  .. (" (cost: $" .. (v1  .. ")..."))))));
											v2 = v14_ref(v1, 30);
											if not v2 then
												break;
											end;
											v2 = function(arg1, arg2, arg3, arg4, arg5)
													local v0;
													v0.WaitForChild(v0, "UpgradeUnit");
													return;
												end;
											pcall(v2);
											v3 = math.random();
											task.wait(.08 + v3 * .21);
										end;
										return o380PsagbGyI34;
									end;
									return OItfS5eWeFov1;
								end;
								return FR01KgaGdR1p;
							end;
							return k2ykWkWHGyCd;
						end;
					local callback_fn_ref_2 = callback_fn;
					local items = {
							700,
							800,
							900,
							44000,
						};
					local items_2 = {
							8000,
							12500,
							26000,
							36000,
						};
					local items_3 = {
							8500,
							15000,
							28500,
							41000,
						};
					local items_4 = {
							9750,
							18250,
							25750,
							37250,
						};
					local items_5 = {
							4000,
							7000,
							10000,
							14000,
						};
					local items_6 = {
							15000,
							25500,
							39000,
							56000,
						};
					local items_7 = {
							4000,
							8750,
							18000,
							30500,
						};
					callback_fn = {
							regeneration = items,
							dragon = items_2,
							iced = items_3,
							transfig = items_4,
							rose = items_5,
							golem = items_6,
							warbell = items_7,
						};
					items = callback_fn;
					local text = "[SPACE V1] ========== PASO 1: REGENERATION FLOWER 1 (NO UPGRADE) ==========";
					print("[SPACE V1] ========== PASO 1: REGENERATION FLOWER 1 (NO UPGRADE) ==========");
					while true do
						text = items_5_ref();
						if not (text < 500) then
							break;
						end;
						task.wait(.2);
					end;
					local n1 = 1;
					items_6 = 0;
					items_7 = 0;
					text = "unit_evolution_flower";
					local v1 = CFrame.new(-25.648456573486, -85.185211181641, 25.779449462891, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local n2 = 31263290390750;
					local v35_ref_ref = v35_ref;
					items_5 = "a\246\162\161k\1745^\020\146\220\145\190Lx\155\233\154w\\_";
					items_4 = callback_fn_10_ref_3;
					items_2 = 180;
					local n3 = 31263290390750;
					items_3 = "Regeneration Flower 1";
					local v2 = callback_fn_ref("unit_evolution_flower", v1, 180, "Regeneration Flower 1");
					callback_fn = not v2;
					if not v2 then
						return o1CFtyjGjmFm;
					else
						local unpack_fn = unpack or table.unpack;
						task.wait(.15);
						while #unit_i_ds < 1 do
							task.wait(.2);
						end;
						text = unit_i_ds[1];
						print("[SPACE V1] ========== PASO 2: 3 EARTH DRAGONS (SIN UPGRADE) ==========");
						items_2 = CFrame.new(-57.395484924316, -85.18522644043, 54.238525390625, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						v1 = CFrame.new(-51.207244873047, -85.185218811035, 52.97972869873, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						n3 = 57.618225097656;
						items_5 = -1;
						items_3 = { CFrame.new(-47.581855773926, -85.185211181641, 57.618225097656, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1) };
						callback_fn = { items_2, v1, unpack_fn(items_3) };
						items_2 = callback_fn;
						v2 = 1;
						for i = 1, 3, 1 do
							n3 = i;
							while true do
								items_5 = items_5_ref();
								if not (items_5 < 6000) then
									break;
								end;
								task.wait(.2);
							end;
							while true do
								v2 = callback_fn_ref("unit_golem_dragon", items_2[n3], 180, "Dragon " .. n3);
								if not v2 then
									break;
								end;
								task.wait(.15);
							end;
							return Eww2iK6jIJ4DV;
						end;
						while #unit_i_ds < 4 do
							task.wait(.2);
						end;
						print("[SPACE V1] ========== PASO 3: UPGRADING DRAGONS ==========");
						for i = 2, 4, 1 do
							callback_fn_ref_2(unit_i_ds[i], 5, items.dragon, "Dragon " .. i - 1);
						end;
						print("[SPACE V1] ========== PASO 4: ICED PRISMFLOWERS ==========");
						v1 = CFrame.new(-39.508110046387, -85.185211181641, 45.956039428711, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						items_3 = CFrame.new(-45.049530029297, -85.185211181641, 25.294250488281, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						items_5 = 29.424087524414;
						n2 = -1;
						v35_ref_ref = { CFrame.new(-46.64306640625, -85.185218811035, 29.424087524414, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1) };
						callback_fn = { v1, items_3, unpack_fn(v35_ref_ref) };
						v1 = callback_fn;
						v2 = 1;
						for i = 1, 3, 1 do
							items_5 = i;
							while true do
								n2 = items_5_ref();
								if not (n2 < 4875) then
									break;
								end;
								task.wait(.2);
							end;
							while true do
								v2 = callback_fn_ref("unit_ice_gem", v1[items_5], 180, "Iced Prismflower " .. items_5);
								if not v2 then
									break;
								end;
								task.wait(.15);
								while #unit_i_ds < 4 + items_5 do
									task.wait(.2);
								end;
								callback_fn_ref_2(unit_i_ds[4 + items_5], 5, items.iced, "Iced Prismflower " .. items_5);
							end;
							return ucBPvMQTUvXt;
						end;
						print("[SPACE V1] ========== PASO 5: TRANSFIGURATION FLOWERS =====");
						items_3 = CFrame.new(-50.530334472656, -85.185218811035, 42.721698760986, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						v35_ref_ref = CFrame.new(-46.605049133301, -85.185218811035, 42.255207061768, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						n2 = 41.678047180176;
						items_6 = -1;
						items_4 = { CFrame.new(-43.167304992676, -85.185218811035, 41.678047180176, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1) };
						v2 = 1;
						callback_fn = { items_3, v35_ref_ref, unpack_fn(items_4) };
						items_3 = callback_fn;
						for i = 1, 3, 1 do
							n2 = i;
							while true do
								items_6 = items_5_ref();
								if not (items_6 < 4750) then
									break;
								end;
								task.wait(.2);
							end;
							while true do
								v2 = callback_fn_ref("unit_wand_flower", items_3[n2], 180, "Transfiguration Flower " .. n2);
								if not v2 then
									break;
								end;
								task.wait(.05);
								while #unit_i_ds < 7 + n2 do
									task.wait(.1);
								end;
								v0();
								callback_fn_ref_2(unit_i_ds[7 + n2], 5, items.transfig, "Transfiguration Flower " .. n2);
							end;
							return zMFeEAfP7qoz;
						end;
						print("[SPACE V1] ========== PASO 6: ENCHANTING ROSES ==========");
						v35_ref_ref = CFrame.new(-33.582092285156, -85.185218811035, 44.441253662109, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						items_6 = -1;
						n1 = 0;
						items_4 = { CFrame.new(-38.935905456543, -85.185218811035, 23.806812286377, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1) };
						callback_fn = { v35_ref_ref, unpack_fn(items_4) };
						v35_ref_ref = callback_fn;
						v2 = 1;
						for i = 1, 2, 1 do
							items_6 = i;
							while true do
								n1 = items_5_ref();
								if not (n1 < 2000) then
									break;
								end;
								task.wait(.2);
							end;
							while true do
								v2 = callback_fn_ref("unit_pink_rose", v35_ref_ref[items_6], 180, "Enchanting Rose " .. items_6);
								if not v2 then
									break;
								end;
								task.wait(.05);
								while #unit_i_ds < 10 + items_6 do
									task.wait(.1);
								end;
								v0();
								callback_fn_ref_2(unit_i_ds[10 + items_6], 5, items.rose, "Enchanting Rose " .. items_6);
							end;
							return yKb8r0gbM2QkEF;
						end;
						print("[SPACE V1] ========== PASO 7: FROST GOLEMS ==========");
						items_4 = CFrame.new(-37.617042541504, -85.185218811035, 29.878269195557, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						n3 = CFrame.new(-37.317901611328, -85.185218811035, 26.345769882202, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						n1 = 37.825775146484;
						items_7 = -1;
						items_5 = { CFrame.new(-34.387344360352, -85.185218811035, 37.825775146484, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1) };
						callback_fn = { items_4, n3, unpack_fn(items_5) };
						v2 = 1;
						items_4 = callback_fn;
						for i = 1, 3, 1 do
							n1 = i;
							while true do
								items_7 = items_5_ref();
								if not (items_7 < 7000) then
									break;
								end;
								task.wait(.2);
							end;
							while true do
								v2 = callback_fn_ref("unit_frost_golem", items_4[n1], 180, "Frost Golem " .. n1);
								if not v2 then
									break;
								end;
								task.wait(.15);
								while #unit_i_ds < 12 + n1 do
									task.wait(.2);
								end;
								callback_fn_ref_2(unit_i_ds[12 + n1], 5, items.golem, "Frost Golem " .. n1);
							end;
							return EhWkhI9DYeDX;
						end;
						n3 = "[SPACE V1] ========== PASO 8: FESTIVE WARBELL ==========";
						print("[SPACE V1] ========== PASO 8: FESTIVE WARBELL ==========");
						while true do
							n3 = items_5_ref();
							if not (n3 < 1600) then
								break;
							end;
							task.wait(.2);
						end;
						n3 = "unit_christmas_bell";
						n2 = CFrame.new(-39.217918395996, -85.185211181641, 40.314556121826, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						v2 = callback_fn_ref("unit_christmas_bell", n2, 180, "Festive Warbell");
						if not v2 then
							return iAsDpKRFXVu0g;
						else
							task.wait(.05);
							while #unit_i_ds < 16 do
								task.wait(.1);
							end;
							v0();
							callback_fn_ref_2(unit_i_ds[16], 5, items.warbell, "Festive Warbell");
							n3 = "[SPACE V1] ========== PASO 9: REGENERATION FLOWER 2 ==========";
							print("[SPACE V1] ========== PASO 9: REGENERATION FLOWER 2 ==========");
							while true do
								n3 = items_5_ref();
								if not (n3 < 500) then
									break;
								end;
								task.wait(.2);
							end;
							n2 = CFrame.new(-22.931949615479, -85.185218811035, 34.311965942383, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
							v2 = callback_fn_ref("unit_evolution_flower", n2, 180, "Regeneration Flower 2");
							if not v2 then
								return M6FHHLojdh2n;
							else
								v2 = task.wait(.15);
								while #unit_i_ds < 17 do
									task.wait(.2);
								end;
								callback_fn_ref_2(v2, 5, items.regeneration, "Regeneration Flower 2");
								callback_fn_ref_2(text, v2, items.regeneration, "Regeneration Flower 1");
								return GMoCMbpypU8Q6;
							end;
						end;
					end;
				end;
			r56 = function(arg1, arg2, arg3, arg4, arg5)
					local v0 = arg2;
					local callback_fn = function(arg1, arg2, arg3)
							local flag, v0, n1, n2, n3, v1, n4, n5;
							print("[AUTO FARM LOOP] ========== STARTING " .. (v0  .. " LOOP =========="));
							items_6_ref();
							local message = "dif_impossible";
							local message_2 = "Impossible";
							local v2 = v0 == "Dojo";
							if v0 == "Dojo" then
 
							else
								if v0 == "Graveyard V2" then
 
								else
									if v0 == "Winter" then
 
									else
										if v0 == "Space V1" then
 
										else
 
										end;
									end;
								end;
							end;
							print("[AUTO FARM LOOP] First run - Activating toggles...");
							task.wait(1);
							local v2_ref = v2;
							local v3 = getgenv();
							local auto_skip = v3.MainTabConfig.AutoSkip;
							local v4 = not v3.MainTabConfig.AutoSkip;
							if not v3.MainTabConfig.AutoSkip then
								getgenv();
							end;
							v2 = v2_ref;
							if v4 then
								auto_skip = getgenv();
								auto_skip.MainTabToggles.AutoSkip.Set(auto_skip.MainTabToggles.AutoSkip, true);
							end;
							v3 = getgenv();
							v2_ref = v2;
							auto_skip = v3.MainTabConfig.AutoPlayAgain;
							v4 = not v3.MainTabConfig.AutoPlayAgain;
							if not v3.MainTabConfig.AutoPlayAgain then
								getgenv();
							end;
							v2 = v2_ref;
							if v4 then
								auto_skip = getgenv();
								auto_skip.MainTabToggles.AutoPlayAgain.Set(auto_skip.MainTabToggles.AutoPlayAgain, true);
							end;
							local v5 = getgenv();
							local anti_ban_config = v5.AntiBanConfig;
							if not v5.AntiBanConfig.AntiAFKEnabled then
								anti_ban_config = function()
										local v0 = getgenv();
										local anti_ban_config = v0.AntiBanConfig;
										if not v0.AntiBanConfig.AntiAFKLoaded then
											anti_ban_config = function(arg1, arg2, arg3)
													local v0;
													local items = { game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn") };
													v0();
													local v1 = v0();
													v1[v0][v0] = true;
													return;
												end;
											pcall(anti_ban_config);
										end;
										anti_ban_config = getgenv();
										anti_ban_config.AntiBanConfig.AntiAFKEnabled = true;
										local v1 = getgenv();
										local anti_ban_toggles = v1.AntiBanToggles;
										v1 = v35_ref;
										if anti_ban_toggles.AntiAFK then
											v1 = getgenv();
											v1.AntiBanToggles.AntiAFK.Set(v1.AntiBanToggles.AntiAFK, true);
										end;
										return;
									end;
								task.spawn(anti_ban_config);
							end;
							anti_ban_config = getgenv();
							anti_ban_config.MainTabConfig.SelectedDifficultyName = message_2;
							anti_ban_config = getgenv();
							anti_ban_config.MainTabConfig.SelectedDifficulty = message;
							v2_ref = v2;
							v3 = getgenv();
							auto_skip = v3.MainTabConfig.AutoDifficulty;
							v4 = not v3.MainTabConfig.AutoDifficulty;
							if not v3.MainTabConfig.AutoDifficulty then
								getgenv();
							end;
							v2 = v2_ref;
							if v4 then
								auto_skip = getgenv();
								auto_skip.MainTabToggles.AutoDifficulty.Set(auto_skip.MainTabToggles.AutoDifficulty, true);
							end;
							task.wait(1);
							anti_ban_config = function(arg1, arg2, arg3, arg4, arg5)
									local v0;
									local v1 = (getfenv and getfenv() or _ENV)[v0];
									v0.WaitForChild(v0, "RemoteFunctions");
									v0.InvokeServer(v0, message);
									return;
								end;
							pcall(anti_ban_config);
							auto_skip = function(arg1, arg2)
									return;
								end;
							print("[AUTO FARM LOOP] ========== EXECUTING FIRST MACRO ==========");
							v7_ref();
							v5 = { pcall(auto_skip) };
							v2_ref = v5[1];
							anti_ban_config = v5[2];
							local n6 = 24154195143663;
							v5 = getgenv();
							local v6 = getgenv();
							local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							local message_3 = "MatchesPlayed";
							v5.AutoFarmConfig.MatchesPlayed = v6.AutoFarmConfig.MatchesPlayed + 1;
							if v2_ref then
								callback_fn_10_ref_3_ref = getgenv();
								print("[AUTO FARM LOOP] \226\156\147 First macro complete! Match count: " .. callback_fn_10_ref_3_ref.AutoFarmConfig.MatchesPlayed);
							else
								callback_fn_10_ref_3_ref = getgenv();
								warn("[AUTO FARM LOOP] \226\157\140 MACRO HAD ERRORS IN MATCH #" .. callback_fn_10_ref_3_ref.AutoFarmConfig.MatchesPlayed);
								message_3 = tostring(anti_ban_config);
								warn("[AUTO FARM LOOP] \240\159\147\139 ERROR DETAILS: " .. message_3);
								warn("[AUTO FARM LOOP] \240\159\148\132 Match still counts, continuing to next");
								v0 = getgenv();
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "\226\154\160\239\184\143 Macro Had Errors", Content = "Match #" .. (v0.AutoFarmConfig.MatchesPlayed .. " completed with errors"), Duration = 4 });
							end;
							auto_skip = v2;
							message_3 = getgenv();
							local anti_ban_config_2 = message_3.AntiBanConfig;
							local text = "\004p\179\154l\009\009\1458I\206]\229\160\r\192\031";
							v5 = message_3.AntiBanConfig.AutoReturnEnabled;
							v4 = message_3.AntiBanConfig.AutoReturnEnabled;
							if message_3.AntiBanConfig.AutoReturnEnabled then
								text = getgenv();
								if text.AntiBanConfig.MatchesBeforeReturn > 0 then
									getgenv();
									getgenv();
								end;
							end;
							v2 = auto_skip;
							if v4 then
								print("[AUTO FARM LOOP] \240\159\154\168 MATCH LIMIT REACHED - DISABLING AUTO PLAY AGAIN \240\159\154\168");
								v5 = getgenv();
								v5.MainTabConfig.AutoPlayAgain = false;
								anti_ban_config_2 = getgenv();
								auto_skip = anti_ban_config_2.MainTabToggles;
								anti_ban_config_2 = v35_ref;
								if auto_skip.AutoPlayAgain then
									anti_ban_config_2 = getgenv();
									anti_ban_config_2.MainTabToggles.AutoPlayAgain.Set(anti_ban_config_2.MainTabToggles.AutoPlayAgain, false);
								end;
							end;
							auto_skip = v2;
							message_3 = getgenv();
							local n7 = 9541810770267;
							local n8 = 11663068615991;
							anti_ban_config_2 = message_3.AutoFarmConfig;
							message_3 = v35_ref;
							v6 = callback_fn_10_ref_3;
							text = "Z\181\211s\188\195\169\225\153";
							callback_fn_10_ref_3_ref = 11663068615991;
							v3 = "IsRunning";
							v4 = anti_ban_config_2.IsRunning;
							if anti_ban_config_2.IsRunning then
								callback_fn_10_ref_3_ref = getgenv();
								message_3 = callback_fn_10_ref_3_ref.AutoFarmConfig;
								n6 = 10044270350917;
								callback_fn_10_ref_3_ref = v35_ref;
								n8 = 10044270350917;
								if not message_3.GraveyardV1Active then
									n8 = getgenv();
									callback_fn_10_ref_3_ref = n8.AutoFarmConfig;
									n3 = 16852906548903;
									n6 = 16852906548903;
									if not callback_fn_10_ref_3_ref.GraveyardV2Active then
										n6 = getgenv();
										n4 = 16022631374117;
										n3 = 16022631374117;
										if not n6.AutoFarmConfig.WinterActive then
											n3 = getgenv();
											n2 = 4967557974281;
											n4 = 4967557974281;
											if not n3.AutoFarmConfig.SpaceV1Active then
												n4 = getgenv();
												n5 = 23570931034848;
												n2 = 23570931034848;
												if not n4.AutoFarmConfig.SpaceV2Active then
													n2 = getgenv();
													n5 = 19878533014568;
													if not n2.AutoFarmConfig.DojoActive then
														n5 = getgenv();
														if not n5.AutoFarmConfig.AutoWinV1Active then
															getgenv();
														end;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
							while true do
								v2 = auto_skip;
								if not v4 then
									break;
								end;
								v6 = "\005\"\007\163}v\207\030\191\149r\r\236\147\020\144bKtv.B\175\015\133j=8k\022\139\000\200\230x\025\211\238\133& 84\203Zk\236\028Z\214\238\129\242\205\191\244\181\'\029";
								callback_fn_10_ref_3_ref = 18008080244929;
								message_3 = 18008080244929;
								print("[AUTO FARM LOOP] ========== WAITING FOR GAME END ==========");
								v3 = false;
								anti_ban_config_2 = true;
								getgenv();
								while true do
									anti_ban_config_2 = function(arg1, arg2)
											local game_gui = n3:FindFirstChild("GameGui");
											local game_gui_ref = game_gui;
											if game_gui then
												game_gui_ref.Screen.Middle:FindFirstChild("GameEnd");
											end;
											return;
										end;
									pcall(anti_ban_config_2);
									task.wait(.5);
								end;
								while true do
									message_3 = getgenv();
									anti_ban_config_2 = message_3.AutoFarmConfig;
									message_3 = v35_ref;
									v3 = "IsRunning";
									if not anti_ban_config_2.IsRunning then
										break;
									end;
									v1 = getgenv();
									print("[AUTO FARM LOOP] Game ended - Match #" .. (v1.AutoFarmConfig.MatchesPlayed .. " complete"));
									n6 = getgenv();
									n1 = 11071516840995;
									callback_fn_10_ref_3_ref = v2;
									v1 = "\202\011t\017\167\148\226\185\160\233\226\248\173\166v\193P";
									n8 = n6.AntiBanConfig;
									n6 = v35_ref;
									v0 = callback_fn_10_ref_3;
									n4 = 22430079953100;
									n7 = "AutoReturnEnabled";
									text = n8.AutoReturnEnabled;
									v6 = n8.AutoReturnEnabled;
									if n8.AutoReturnEnabled then
										v1 = getgenv();
										if v1.AntiBanConfig.MatchesBeforeReturn > 0 then
											getgenv();
											getgenv();
										end;
									end;
									while true do
										v2 = callback_fn_10_ref_3_ref;
										if v6 then
											break;
										end;
										print("[AUTO FARM LOOP] ========== PLAY AGAIN ==========");
										flag = false;
										text = true;
										while true do
											text = function(arg1)
													local v35_ref_ref = v35_ref;
													local n1 = 20035191858289;
													local game_gui = n3:FindFirstChild("GameGui");
													local game_gui_ref = game_gui;
													if not game_gui then
														return;
													else
														n1 = callback_fn_10_ref_3;
														game_gui = game_gui_ref.Screen.Middle.GameEnd.Items.Frame.Actions.Items:FindFirstChild("Again");
														v35_ref_ref = game_gui;
														game_gui = game_gui;
														if game_gui then
															print("[AUTO FARM LOOP] \226\156\133 Again button visible - clicking");
															game_gui = getconnections(v35_ref_ref.MouseButton1Click);
															n1 = game_gui;
															game_gui = game_gui;
															if game_gui then
																n1 = function(arg1, arg2, arg3, arg4)
																		return;
																	end;
																pcall(n1);
															end;
															n1 = function()
																	local v0;
																	local v1 = (getfenv and getfenv() or _ENV)[v0];
																	v0.WaitForChild(v0, "RemoteFunctions");
																	v0.InvokeServer(v0);
																	return;
																end;
															pcall(n1);
														end;
														return;
													end;
												end;
											pcall(text);
											if not flag then
												task.wait(.3);
											end;
										end;
										print("[AUTO FARM LOOP] \226\156\133 Play again executed, waiting for new game...");
										task.wait(6);
										n4 = getgenv();
										print("[AUTO FARM LOOP] \240\159\148\132 Resetting tracking for Match #" .. n4.AutoFarmConfig.MatchesPlayed + 1);
										v7_ref();
										n1 = getgenv();
										print("[AUTO FARM LOOP] ========== VOTING DIFFICULTY FOR MATCH #" .. (n1.AutoFarmConfig.MatchesPlayed + 1  .. " =========="));
										n8 = function(arg1, arg2, arg3)
												local v0;
												local v1 = (getfenv and getfenv() or _ENV)[v0];
												v0.WaitForChild(v0, "RemoteFunctions");
												v0.InvokeServer(v0, message);
												return;
											end;
										pcall(n8);
										task.wait(1);
										n1 = getgenv();
										print("[AUTO FARM LOOP] ========== EXECUTING MACRO FOR MATCH #" .. (n1.AutoFarmConfig.MatchesPlayed + 1  .. " =========="));
										n7 = function(arg1)
												return;
											end;
										n6 = { pcall(n7) };
										v3 = n6[2];
										n6 = getgenv();
										v1 = "\144\254\142\234ldN\178\145\135e\181\191";
										v0 = callback_fn_10_ref_3;
										n8 = 1;
										message_3 = n6.AutoFarmConfig.MatchesPlayed + 1;
										if n6.AutoFarmConfig.MatchesPlayed then
											n8 = getgenv();
											n8.AutoFarmConfig.MatchesPlayed = message_3;
											v1 = getgenv();
											print("[AUTO FARM LOOP] \226\156\133 MACRO COMPLETE! Match count: " .. v1.AutoFarmConfig.MatchesPlayed);
										else
											warn("[AUTO FARM LOOP] \226\157\140 MACRO FAILED IN MATCH #" .. message_3);
											v0 = tostring(v3);
											warn("[AUTO FARM LOOP] \240\159\147\139 ERROR DETAILS: " .. v0);
											warn("[AUTO FARM LOOP] \240\159\148\132 Tracking will reset for next match");
											n8 = getgenv();
											n8.AutoFarmConfig.MatchesPlayed = message_3;
											n8 = { Title = "\226\154\160\239\184\143 Macro Failed", Content = "Error in match #" .. (message_3  .. " - continuing to next match"), Duration = 4 };
											callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, n8);
										end;
										text = v2;
										v0 = getgenv();
										n7 = v0.AntiBanConfig;
										n4 = "\197%\027\020\166\129\'\142\026\n\138\2382c@2s";
										n8 = v0.AntiBanConfig.AutoReturnEnabled;
										callback_fn_10_ref_3_ref = v0.AntiBanConfig.AutoReturnEnabled;
										if v0.AntiBanConfig.AutoReturnEnabled then
											n4 = getgenv();
											if n4.AntiBanConfig.MatchesBeforeReturn > 0 then
												getgenv();
												getgenv();
											end;
										end;
										if callback_fn_10_ref_3_ref then
											print("[AUTO FARM LOOP] \240\159\154\168 MATCH LIMIT REACHED - DISABLING AUTO PLAY AGAIN \240\159\154\168");
											n8 = getgenv();
											n8.MainTabConfig.AutoPlayAgain = false;
											n7 = getgenv();
											text = n7.MainTabToggles;
											n7 = v35_ref;
											if text.AutoPlayAgain then
												n7 = getgenv();
												n7.MainTabToggles.AutoPlayAgain.Set(n7.MainTabToggles.AutoPlayAgain, false);
											end;
										end;
									end;
									print("[AUTO FARM LOOP] ========== MATCH LIMIT REACHED - RETURNING TO LOBBY ==========");
									task.wait(3);
									print("[AUTO FARM LOOP] Using BackToMainLobby RemoteFunction...");
									text = function(arg1, arg2, arg3, arg4, arg5)
											local v0;
											local v1 = (getfenv and getfenv() or _ENV)[v0];
											v0.WaitForChild(v0, "RemoteFunctions");
											v0.InvokeServer(v0);
											return;
										end;
									callback_fn_10_ref_3_ref = pcall(text);
									if callback_fn_10_ref_3_ref then
										print("[AUTO FARM LOOP] \226\156\133 RETURN TO LOBBY SUCCESSFUL!");
										task.wait(10);
									else
										warn("[AUTO FARM LOOP] \226\156\151 Return failed - Please return manually");
									end;
									n8 = getgenv();
									n7 = v35_ref;
									text = "MainTabToggles";
									if n8.MainTabToggles then
										n7 = getgenv();
										text = n7.MainTabToggles;
										n7 = v35_ref;
										if text.AutoSkip then
											n7 = getgenv();
											n7.MainTabToggles.AutoSkip.Set(n7.MainTabToggles.AutoSkip, false);
										end;
										n7 = getgenv();
										text = n7.MainTabToggles;
										n7 = v35_ref;
										if text.AutoPlayAgain then
											n7 = getgenv();
											n7.MainTabToggles.AutoPlayAgain.Set(n7.MainTabToggles.AutoPlayAgain, false);
										end;
										n7 = getgenv();
										text = n7.MainTabToggles;
										n7 = v35_ref;
										if text.AutoDifficulty then
											n7 = getgenv();
											n7.MainTabToggles.AutoDifficulty.Set(n7.MainTabToggles.AutoDifficulty, false);
										end;
									end;
									items_8_ref();
									n8 = getgenv();
									n8.AutoFarmConfig.IsRunning = false;
									n8 = getgenv();
									n8.AutoFarmConfig.GraveyardV1Active = false;
									n8 = getgenv();
									n8.AutoFarmConfig.GraveyardV2Active = false;
									n8 = getgenv();
									n8.AutoFarmConfig.WinterActive = false;
									n8 = getgenv();
									n8.AutoFarmConfig.DojoActive = false;
									n8 = getgenv();
									n8.AutoFarmConfig.AutoWinV1Active = false;
									n8 = getgenv();
									n8.AutoFarmConfig.AutoWinV2Active = false;
									n8 = getgenv();
									n8.AutoFarmConfig.FirstRunComplete = false;
									n8 = getgenv();
									n8.AutoFarmConfig.MatchesPlayed = 0;
									text = getgenv();
									text.NoahHubLocked = false;
									v6 = callback_fn_10_ref_2;
									n7 = "Title";
									n6 = "\226\156\133 Auto Farm Completed";
									v0 = "Content";
									n4 = callback_fn_10_ref_3_ref;
									if callback_fn_10_ref_3_ref then
										getgenv();
									end;
									n8 = { [n7] = n6, [v0] = n4, Duration = 5 };
									v6.Notify(v6, n8);
									print("[AUTO FARM LOOP] ========== FARM STOPPED SUCCESSFULLY ==========");
									return;
								end;
								items_8_ref();
								print("[AUTO FARM LOOP] ========== LOOP STOPPED ==========");
								return;
							end;
						end;
					return;
				end;
			items_9 = function(arg1, arg2, arg3, arg4)
					return CiC23WdBF3JQD;
				end;
			r75 = function(arg1, arg2, arg3, arg4)
					local v0, flag;
					print("[SPACE V2] Starting Regeneration Flower strategy...");
					local v1 = getgenv();
					local unit_i_ds = v1.GlobalTracking.unitIDs;
					local callback_fn = function(arg1, arg2, arg3, arg4)
							local n1 = 1;
							for i = 1, 50, 1 do
								while true do
									n1 = items_7_ref();
									if n1 then
										break;
									end;
									while true do
										n1 = v11_ref(arg1, arg2, arg3);
										if n1 then
											break;
										end;
										task.wait(.05);
									end;
									return jJlgifHA9wJbtU;
								end;
								return zeNsQHdYw2cpD;
							end;
							return nOXP9QCTWDMSgw;
						end;
					v1 = callback_fn;
					callback_fn = function(arg1, arg2, arg3, arg4)
							local v0, v1, v2, v3;
							local n1 = 2;
							for i = 2, arg2, 1 do
								while true do
									v0 = i;
									n1 = items_7_ref();
									if n1 then
										break;
									end;
									while true do
										v1 = arg3[v0 - 1];
										if not (not arg3[v0 - 1]) then
											break;
										end;
										while true do
											print("[SPACE V2] Upgrading " .. (arg4  .. (" to Level " .. (v0  .. (" (cost: $" .. (v1  .. ")..."))))));
											v2 = v14_ref(v1, 30);
											if not v2 then
												break;
											end;
											v2 = function(arg1)
													local v0;
													v0.WaitForChild(v0, "UpgradeUnit");
													return;
												end;
											pcall(v2);
											v3 = math.random();
											task.wait(.08 + v3 * .21);
										end;
										return SEfMHuin6BJTe6;
									end;
									return XQDPe2Sa340s;
								end;
								return sUTff3lZNJkPh;
							end;
							return zBTUDaDZOIIg;
						end;
					local callback_fn_ref = callback_fn;
					callback_fn = {
							700,
							800,
							900,
							44000,
						};
					local callback_fn_ref_2 = callback_fn;
					local text = "[SPACE V2] ========== PASO 1: REGENERATION FLOWER 1 ==========";
					local v2 = print("[SPACE V2] ========== PASO 1: REGENERATION FLOWER 1 ==========");
					while true do
						text = items_5_ref();
						v2 = 500;
						if not (text < 500) then
							break;
						end;
						while true do
							v2 = items_7_ref();
							if v2 then
								break;
							end;
							task.wait(.2);
						end;
						return luxM9WgZIM5Ao;
					end;
					local v3 = CFrame.new(-25.648456573486, -85.185211181641, 25.779449462891, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local v35_ref_ref = v35_ref;
					local n1 = 180;
					local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
					local n2 = 17262804000614;
					local text_2 = "Regeneration Flower 1";
					v2 = v1("unit_evolution_flower", v3, 180, "Regeneration Flower 1");
					if not v2 then
						return xhktNNSr1sgxN;
					else
						task.wait(.15);
						while #unit_i_ds < 1 do
							task.wait(.2);
						end;
						v0 = unit_i_ds[1];
						callback_fn_10_ref_3_ref = tostring(unit_i_ds[1]);
						print("[SPACE V2] \226\156\147 Regeneration Flower 1 tracked (ID: " .. (callback_fn_10_ref_3_ref .. ")"));
						n1 = "[SPACE V2] ========== PASO 2: REGENERATION FLOWER 2 ==========";
						v2 = print("[SPACE V2] ========== PASO 2: REGENERATION FLOWER 2 ==========");
						while true do
							n1 = items_5_ref();
							v2 = 500;
							if not (n1 < 500) then
								break;
							end;
							while true do
								v2 = items_7_ref();
								if v2 then
									break;
								end;
								task.wait(.2);
							end;
							return nil;
						end;
						text_2 = CFrame.new(-22.931949615479, -85.185218811035, 34.311965942383, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
						n2 = callback_fn_10_ref_3;
						v35_ref_ref = "Regeneration Flower 2";
						v2 = v1("unit_evolution_flower", text_2, 180, "Regeneration Flower 2");
						if not v2 then
							return I1XLtyIpMGx4ST;
						else
							task.wait(.15);
							while #unit_i_ds < 2 do
								task.wait(.2);
							end;
							n2 = tostring(unit_i_ds[2]);
							print("[SPACE V2] \226\156\147 Regeneration Flower 2 tracked (ID: " .. (n2  .. ")"));
							print("[SPACE V2] ========== PASO 3: UPGRADE AMBOS \226\134\146 LVL 2 ==========");
							callback_fn_ref(v0, 3, callback_fn_ref_2, "Regeneration Flower 1");
							callback_fn_ref(unit_i_ds[2], 2, callback_fn_ref_2, "Regeneration Flower 2");
							flag = false;
							v35_ref_ref = true;
							v2 = true;
							getgenv();
							while true do
								while true do
									v2 = items_7_ref();
									if v2 then
										break;
									end;
									while true do
										v35_ref_ref = function()
												local callback_fn_10_ref_3_ref, message;
												local message_2 = "\195\200\143Ky3\208\149?\172\014\006\026\252";
												local n1 = 542802477308;
												local v35_ref_ref = v35_ref;
												local game_gui_no_inset = n3:FindFirstChild("GameGuiNoInset");
												local game_gui_no_inset_ref = game_gui_no_inset;
												if not game_gui_no_inset then
													n3.FindFirstChild(n3, "GameGui");
												end;
												local game_gui_no_inset_ref_ref = game_gui_no_inset_ref;
												if game_gui_no_inset_ref then
													v35_ref_ref = { game_gui_no_inset_ref_ref:GetDescendants() };
													for key, value in pairs((unpack or table.unpack)(v35_ref_ref)) do
														callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
														message = "TextLabel";
														n1 = value:IsA("TextLabel");
														message_2 = n1;
														if n1 then
															message = tonumber;
															callback_fn_10_ref_3_ref = string.match(value.Text, "^Wave%s*(%d+)");
															n1 = callback_fn_10_ref_3_ref;
															if not callback_fn_10_ref_3_ref then
																string.match(value.Text, "Wave%s*(%d+)%s*/");
															end;
															message_2 = message(n1);
															if message_2 then
																while true do
																	print("[SPACE V2] Current wave: " .. message_2);
																	if message_2 >= 10 then
																		break;
																	end;
																end;
																print("[SPACE V2] \226\156\147\226\156\147\226\156\147 WAVE 10 REACHED! \226\156\147\226\156\147\226\156\147");
																return;
															end;
														end;
													end;
													return;
												end;
											end;
										pcall(v35_ref_ref);
										if flag then
											break;
										end;
										task.wait(.5);
									end;
									if not flag then
										return XsZEB1Dc8onO;
									else
										math.random();
										callback_fn_10_ref_3_ref = function()
												local v0;
												v0.WaitForChild(v0, "SellUnit");
												return;
											end;
										math.random();
										callback_fn_10_ref_3_ref = function(arg1, arg2)
												local v0;
												v0.WaitForChild(v0, "SellUnit");
												return;
											end;
										return ixZSqYkALn0tF;
									end;
								end;
								return UB3WAV9QIKYFhG;
							end;
						end;
					end;
				end;
			r81 = function(arg1)
					local flag, n1, n2, n3, n4, message, n5, n6, message_2, n7, n8;
					print("[WINTER] Starting Rafflesia strategy for Christmas map...");
					local v0 = getgenv();
					local unit_i_ds = v0.GlobalTracking.unitIDs;
					local callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local v0;
							math.random();
							math.random();
							CFrame.new(v0.X, v0.Y, v0.Z, .92530518770218, 0, -0.37922340631485, 0, 1, 0, .37922346591949, 0, .92530506849289);
							return bfnstk1r3j5up;
						end;
					v0 = callback_fn;
					callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local v0;
							math.random();
							math.random();
							CFrame.new(v0.X, v0.Y, v0.Z, -0.92420291900635, 0, -0.38190197944641, 0, 1.0000001192093, 0, .38190203905106, 0, -0.92420279979706);
							return aCkN66SkQiOt9;
						end;
					local callback_fn_ref = callback_fn;
					callback_fn = function(arg1, arg2, arg3)
							local v0;
							math.random();
							math.random();
							CFrame.new(v0.X, v0.Y, v0.Z, -0.38839745521545, 0, .92149198055267, 0, 1.0000001192093, 0, -0.92149198055267, 0, -0.38839745521545);
							return p3IfanjrGspNe;
						end;
					local callback_fn_ref_2 = callback_fn;
					callback_fn = function()
							local v0;
							math.random();
							math.random();
							CFrame.new(v0.X, v0.Y, v0.Z, .83087575435638, -0.00013255375961307, .55645805597305, -7.2759576141834e-12, 1, .00023820977366995, -0.5564581155777, -0.00019792272360064, .83087569475174);
							return zRehmGUMCy5Z;
						end;
					local callback_fn_ref_3 = callback_fn;
					callback_fn = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
							arg4 = arg4 or 200;
							local text = " (max ";
							local v35_ref_ref = v35_ref;
							local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							print("[WINTER] Attempting to plant " .. (arg2  .. (" (max " .. ((arg4 or 200 or 200 or 200 or 200 or 200 or 200 or 200 or 200 or 200 or 200) .. " attempts)"))));
							local n1 = 1;
							local v0 = arg4 or 200 or 200 or 200 or 200 or 200 or 200;
							local n2 = 1;
							local flag = false;
							local n3 = 0;
							while true do
								n3 = n3 + n2;
								n1 = 4653428;
								if not (flag and ((((((n3 + n2) + n2) + n2) + n2) + n2) + n2) + n2 >= v0 or not flag and ((((((n3 + n2) + n2) + n2) + n2) + n2) + n2) + n2 <= v0) then
									break;
								end;
								while true do
									n1 = n3;
									text = items_7_ref();
									if text then
										break;
									end;
									arg1();
									v35_ref_ref = function()
											local args;
											args.WaitForChild(args, "PlaceUnit");
											return (unpack or table.unpack)(args);
										end;
									callback_fn_10_ref_3_ref = { pcall(v35_ref_ref) };
									while not callback_fn_10_ref_3_ref[1] do
										task.wait(.05);
									end;
									print("[WINTER] \226\156\147 Placed " .. (arg2  .. (" on attempt " .. n1)));
									return true;
								end;
								warn("[WINTER] Game ended - stopping plant attempts");
								return false;
							end;
							warn("[WINTER] \226\157\140 FAILED to plant " .. (arg2  .. (" after " .. (arg4  .. " attempts!"))));
							return false;
						end;
					local callback_fn_ref_4 = callback_fn;
					print("[WINTER] ========== PASO 1: RAFFLESIA 1 (PATH 1) ==========");
					local text = "[WINTER] Waiting for money...";
					local v1 = print("[WINTER] Waiting for money...");
					while true do
						text = items_5_ref();
						v1 = 1250;
						if not (text < 1250) then
							break;
						end;
						while true do
							v1 = items_7_ref();
							if v1 then
								break;
							end;
							task.wait(.2);
						end;
						return Yw8tviVE3l3rnK;
					end;
					local n9 = 18411077951869;
					local v2 = items_5_ref();
					print("[WINTER] \226\156\147 Money reached: $" .. v2);
					local n10 = 8956506771530;
					v2 = 8956506771530;
					local n11 = 100;
					v1 = callback_fn_ref_4(v0, "Rafflesia 1", 1, 100);
					callback_fn = not v1;
					if not v1 then
						return VDBqTHJWflplUo;
					else
						n10 = 35182666661887;
						task.wait(.3);
						callback_fn = 0;
						v2 = 1;
						v1 = #unit_i_ds < 1;
						while #unit_i_ds < 1 do
							while true do
								v1 = items_7_ref();
								if v1 then
									break;
								end;
								task.wait(.2);
							end;
							return u8hpv8Ka5TBLT;
						end;
						n11 = 1;
						v1 = #unit_i_ds < 1;
						if #unit_i_ds < 1 then
							v1("[WINTER] \226\157\140 Failed to track Rafflesia 1");
							return v1;
						else
							n3 = 24740761414912;
							print("[WINTER] \226\156\147 Rafflesia 1 tracked (ID: " .. (unit_i_ds[1] .. ")"));
							print("[WINTER] ========== PASO 2: RAFFLESIA 2 (PATH 2) ==========");
							v1 = print;
							v2 = "[WINTER] Waiting for money...";
							n11 = print("[WINTER] Waiting for money...");
							while true do
								v2 = items_5_ref();
								n11 = 1250;
								v1 = v2 < 1250;
								if not (v2 < 1250) then
									break;
								end;
								while true do
									n11 = items_7_ref();
									if n11 then
										break;
									end;
									task.wait(.2);
								end;
								return v1;
							end;
							n2 = 998268256720;
							n9 = items_5_ref();
							print("[WINTER] \226\156\147 Money reached: $" .. n9);
							n1 = 23510905219780;
							n9 = 23510905219780;
							n10 = 100;
							v2 = "Rafflesia 2";
							n11 = callback_fn_ref_4(callback_fn_ref, "Rafflesia 2", 2, 100);
							v1 = not n11;
							if not n11 then
								v1.Notify(v1, { Title = "Winter Error", Content = "Failed to plant Rafflesia 2", Duration = 5 });
								return v1;
							else
								n1 = 29416964322690;
								task.wait(.3);
								v2 = callback_fn;
								n9 = 2;
								while #unit_i_ds < 2 do
									while true do
										v2 = items_7_ref();
										if v2 then
											break;
										end;
										task.wait(.2);
									end;
									return false;
								end;
								n10 = 2;
								if #unit_i_ds < 2 then
									warn("[WINTER] \226\157\140 Failed to track Rafflesia 2");
									return false;
								else
									message = "|";
									n5 = 32175977659015;
									n4 = 32175977659015;
									print("[WINTER] \226\156\147 Rafflesia 2 tracked (ID: " .. (unit_i_ds[2] .. ")"));
									print("[WINTER] ========== PASO 3: RAFFLESIA 3 (PATH 3) ==========");
									n9 = "[WINTER] Waiting for money...";
									n10 = print("[WINTER] Waiting for money...");
									while true do
										n9 = items_5_ref();
										n10 = 1250;
										if not (n9 < 1250) then
											break;
										end;
										while true do
											n10 = items_7_ref();
											if n10 then
												break;
											end;
											task.wait(.2);
										end;
										return false;
									end;
									n3 = 33836696665484;
									n2 = items_5_ref();
									print("[WINTER] \226\156\147 Money reached: $" .. n2);
									n2 = 35112181301214;
									n1 = 100;
									n9 = "Rafflesia 3";
									n10 = callback_fn_ref_4(callback_fn_ref_2, "Rafflesia 3", 3, 100);
									if not n10 then
										callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Winter Error", Content = "Failed to plant Rafflesia 3", Duration = 5 });
										return false;
									else
										task.wait(.3);
										n9 = callback_fn;
										n2 = 3;
										while #unit_i_ds < 3 do
											while true do
												n9 = items_7_ref();
												if n9 then
													break;
												end;
												task.wait(.2);
											end;
											return false;
										end;
										n1 = 3;
										if #unit_i_ds < 3 then
											warn("[WINTER] \226\157\140 Failed to track Rafflesia 3");
											return false;
										else
											message_2 = "\233";
											n7 = 4871962396892;
											n6 = 4871962396892;
											print("[WINTER] \226\156\147 Rafflesia 3 tracked (ID: " .. (unit_i_ds[3] .. ")"));
											print("[WINTER] ========== PASO 4: RAFFLESIA 4 (PATH 4) ==========");
											n2 = "[WINTER] Waiting for money...";
											n1 = print("[WINTER] Waiting for money...");
											while true do
												n2 = items_5_ref();
												n1 = 1250;
												if not (n2 < 1250) then
													break;
												end;
												while true do
													n1 = items_7_ref();
													if n1 then
														break;
													end;
													task.wait(.2);
												end;
												return false;
											end;
											n5 = 19467583857513;
											n3 = items_5_ref();
											print("[WINTER] \226\156\147 Money reached: $" .. n3);
											n4 = "\202\002\014\159\151\175_\138\237\230\145";
											message = 25762915233500;
											n2 = "Rafflesia 4";
											n1 = callback_fn_ref_4(callback_fn_ref_3, "Rafflesia 4", 4, 100);
											if not n1 then
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Winter Error", Content = "Failed to plant Rafflesia 4", Duration = 5 });
												return false;
											else
												n4 = "FbwG";
												message = 845213876617;
												task.wait(.3);
												n2 = callback_fn;
												while #unit_i_ds < 4 do
													while true do
														n2 = items_7_ref();
														if n2 then
															break;
														end;
														task.wait(.2);
													end;
													return false;
												end;
												if #unit_i_ds < 4 then
													warn("[WINTER] \226\157\140 Failed to track Rafflesia 4");
													return false;
												else
													n7 = callback_fn_10_ref_3;
													n8 = 15659030797435;
													print("[WINTER] \226\156\147 Rafflesia 4 tracked (ID: " .. (unit_i_ds[4] .. ")"));
													n6 = "\161\127\159e\011D-\237\164\224\006k\178\218\141\129C\130\022\2388\216\236\193\127k\231x\031\137\r*\136Y`n\008\167+\200\004\199\134\219p{\001\026\223\1934B\154j\004\166\171\230\185Q\178lyL\225\156\183\214<\182\146\n>\255\214/i";
													message_2 = 34759016251193;
													print("[WINTER] ========== ALL 4 RAFFLESIAS PLANTED - WAITING FOR WAVE 10 ==========");
													flag = false;
													n4 = callback_fn;
													n5 = false;
													message = true;
													getgenv();
													while true do
														while true do
															n4 = items_7_ref();
															if n4 then
																break;
															end;
															while true do
																message = function(arg1, arg2)
																		local callback_fn_10_ref_3_ref, message;
																		local message_2 = "WZ\228h\243r\'\188\142\204\205\019\014\252";
																		local n1 = 8739019935717;
																		local v35_ref_ref = v35_ref;
																		local game_gui_no_inset = n3:FindFirstChild("GameGuiNoInset");
																		local game_gui_no_inset_ref = game_gui_no_inset;
																		if not game_gui_no_inset then
																			n3.FindFirstChild(n3, "GameGui");
																		end;
																		local game_gui_no_inset_ref_ref = game_gui_no_inset_ref;
																		if game_gui_no_inset_ref then
																			v35_ref_ref = { game_gui_no_inset_ref_ref:GetDescendants() };
																			for key, value in pairs((unpack or table.unpack)(v35_ref_ref)) do
																				callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
																				message = "TextLabel";
																				n1 = value:IsA("TextLabel");
																				message_2 = n1;
																				if n1 then
																					message = tonumber;
																					callback_fn_10_ref_3_ref = string.match(value.Text, "^Wave%s*(%d+)");
																					n1 = callback_fn_10_ref_3_ref;
																					if not callback_fn_10_ref_3_ref then
																						string.match(value.Text, "Wave%s*(%d+)%s*/");
																					end;
																					message_2 = message(n1);
																					if message_2 then
																						while true do
																							print("[WINTER] Current wave: " .. message_2);
																							if message_2 >= 9 then
																								break;
																							end;
																						end;
																						print("[WINTER] \226\156\147\226\156\147\226\156\147 WAVE 10 REACHED! \226\156\147\226\156\147\226\156\147");
																						return;
																					end;
																				end;
																			end;
																			return;
																		end;
																	end;
																pcall(message);
																if flag then
																	break;
																end;
																task.wait(.5);
															end;
															n6 = getgenv();
															message = n6.AutoFarmConfig;
															n6 = v35_ref;
															n8 = "\216a\191\009\214\235\204\003\006\227\229\012";
															message_2 = callback_fn_10_ref_3;
															n7 = 32612750097234;
															n5 = "WinterActive";
															n4 = message.WinterActive;
															if not message.WinterActive then
																print("[WINTER] Farm stopped by user");
																return false;
															else
																n4 = items_7_ref();
																if n4 then
																	warn("[WINTER] \226\156\133 Game ended - continuing to next match");
																	return true;
																else
																	if not flag then
																		warn("[WINTER] Wave 10 not detected but continuing");
																		return true;
																	else
																		print("[WINTER] ========== WAVE 10 REACHED - SELLING ALL RAFFLESIAS ==========");
																		n6 = math.random();
																		n8 = string.format("%.2f", 1.15 + n6 * .35);
																		print("[WINTER] Waiting " .. (n8  .. "s before selling..."));
																		task.wait(1.15 + n6 * .35);
																		n5 = function(arg1, arg2)
																				local v0;
																				v0.WaitForChild(v0, "SellUnit");
																				return;
																			end;
																		pcall(n5);
																		print("[WINTER] Sold Rafflesia 3");
																		message_2 = math.random();
																		task.wait(.05 + message_2 * .1);
																		n6 = function(arg1, arg2, arg3, arg4, arg5)
																				local v0;
																				v0.WaitForChild(v0, "SellUnit");
																				return;
																			end;
																		pcall(n6);
																		print("[WINTER] Sold Rafflesia 1");
																		n7 = math.random();
																		message_2 = function(arg1, arg2, arg3, arg4)
																				local v0;
																				v0.WaitForChild(v0, "SellUnit");
																				return;
																			end;
																		task.wait(.05 + n7 * .1);
																		pcall(message_2);
																		print("[WINTER] Sold Rafflesia 2");
																		n8 = math.random();
																		task.wait(.05 + n8 * .1);
																		n7 = function(arg1, arg2, arg3, arg4, arg5)
																				local v0;
																				v0.WaitForChild(v0, "SellUnit");
																				return;
																			end;
																		pcall(n7);
																		print("[WINTER] Sold Rafflesia 4");
																		print("[WINTER] ========== SELL COMPLETE ==========");
																		return true;
																	end;
																end;
															end;
														end;
														warn("[WINTER] \226\156\133 Game ended before Wave 10 - continuing to next match");
														return true;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			r23 = function(arg1)
					print("[AUTO WIN V2] Starting Rainbow Tomato strategy...");
					local v0 = getgenv();
					local unit_i_ds = v0.GlobalTracking.unitIDs;
					local v1 = CFrame.new(-345.86987304688, 61.680305480957, -116.59803771973, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local items = { cframe = v1, rotation = 180 };
					local v2 = CFrame.new(-341.46170043945, 61.680305480957, -105.6526260376, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v0 = { cframe = v2, rotation = 180 };
					local v3 = CFrame.new(-325.44848632812, 61.680305480957, -113.05741119385, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local items_2 = { cframe = v3, rotation = 180 };
					local v4 = CFrame.new(-347.02380371094, 61.680305480957, -101.94581604004, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v1 = { cframe = v4, rotation = 180 };
					local v5 = CFrame.new(-321.42462158203, 61.680305480957, -100.28288269043, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v2 = { cframe = v5, rotation = 180 };
					local v6 = CFrame.new(-340.77688598633, 61.680305480957, -116.85527801514, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v3 = { cframe = v6, rotation = 180 };
					local v7 = CFrame.new(-326.37258911133, 61.680309295654, -111.12118530273, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v4 = { cframe = v7, rotation = 180 };
					local v8 = CFrame.new(-343.39996337891, 61.680305480957, -109.55160522461, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					v5 = { cframe = v8, rotation = 180 };
					local v9 = CFrame.new(-326.04852294922, 61.680305480957, -118.88896179199, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local n1 = 0;
					v6 = { cframe = v9, rotation = 180 };
					local n2 = 1;
					local n3 = 0;
					local n4 = -8.7422776573476e-08;
					local v10 = CFrame.new(-341.57507324219, 61.680305480957, -115.53831481934, -1, 0, -8.7422776573476e-08, 0, 1, 0, 8.7422776573476e-08, 0, -1);
					local n5 = 6343763528586;
					local text = "\005\009\019\172\227\011U7";
					v7 = { cframe = v10, rotation = 180 };
					local items_3 = {
							items,
							v0,
							items_2,
							v1,
							v2,
							v3,
							v4,
							v5,
							v6,
							v7,
						};
					v0 = items_3;
					items_3 = {
							125,
							175,
							350,
							500,
						};
					items_2 = items_3;
					items_3 = {};
					v1 = items_3;
					items = 1;
					for i = 1, #v0, 1 do
						while true do
							items = items_7_ref();
							v6 = i;
							if items then
								break;
							end;
							n5 = 1009694343638;
							text = "\177>\221\028\251I";
							v10 = "/10...";
							print("[AUTO WIN V2] Planting Rainbow Tomato " .. (v6  .. "/10..."));
							v7 = items_5_ref();
							items = 100;
							if v7 < 100 then
								while true do
									items = items_7_ref();
									if items then
										break;
									end;
									task.wait(.2);
								end;
								return ve8HRwC5PdcQE;
							else
								items = 1;
								v10 = false;
								for i = 1, 10, 1 do
									while true do
										items = v11_ref("unit_tomato_rainbow", v0[v6].cframe, v0[v6].rotation);
										if items then
											break;
										end;
										task.wait(.05);
									end;
									n3 = ":\001\234\127a\008o\144\149\031L\204\194\132\1648\025\240\'\187\239\218m*O\212\246\190\211C\246:\185\244\228\194v\025\145c";
									n2 = 18843564630598;
									text = v35_ref;
									n5 = callback_fn_10_ref_3;
									n4 = 18843564630598;
									print("[AUTO WIN V2] \226\156\147 Placed Rainbow Tomato " .. v6);
									task.wait(.15);
									v10 = #unit_i_ds;
									items = #unit_i_ds < v6;
									if #unit_i_ds < v6 then
										while true do
											items = items_7_ref();
											if items then
												break;
											end;
											task.wait(.2);
										end;
										return TCb6pX9umWoa;
									else
										while not (#unit_i_ds < v6) do
											v1[v6] = unit_i_ds[v6];
											n5 = " (ID: ";
											n2 = tostring(unit_i_ds[v6]);
											n1 = 13811179411743;
											n3 = ")";
											n4 = n2  .. ")";
											print("[AUTO WIN V2] \226\156\147 Tracked Rainbow Tomato " .. (v6  .. (" (ID: " .. (n2  .. ")"))));
											v10 = 2;
											text = 6117885;
											items = 5792464;
											while true do
												text = v10;
												n5 = items_7_ref();
												if n5 then
													break;
												end;
												n1 = " to Level ";
												print("[AUTO WIN V2] Upgrading Rainbow Tomato " .. (v6  .. (" to Level " .. (text .. "..."))));
												n4 = items_5_ref;
												n3 = items_5_ref();
												items = n3 < items_2[text - 1];
												if n3 < items_2[text - 1] then
													while true do
														n4 = items_7_ref();
														if n4 then
															break;
														end;
														task.wait(.2);
													end;
													return items;
												else
													n3 = function(arg1, arg2)
															local v0;
															v0.WaitForChild(v0, "UpgradeUnit");
															local _3ugn_an_dwu0z_t = (getfenv and getfenv() or _ENV)["3UgnANDwu0zT"];
															return;
														end;
													pcall(n3);
													n1 = math.random();
													task.wait(.28 + n1 * .27);
												end;
											end;
											return items;
										end;
										items("[AUTO WIN V2] \226\157\140 Failed to track Rainbow Tomato " .. v6);
										return items;
									end;
								end;
							end;
						end;
						return eR4cd4pzqRbx;
					end;
					return Z0VZpYNLAjpNQb;
				end;
			callback_fn_5_ref = callback_fn_5;
			callback_fn_3_ref = callback_fn_3;
			r32 = function(arg1, arg2)
					local flag, n1, callback_fn_10_ref_3_ref, n2, n3;
					print("[DOJO] Starting Rafflesia strategy...");
					local v0 = getgenv();
					local unit_i_ds = v0.GlobalTracking.unitIDs;
					v0 = "[DOJO] Planting Rafflesia 1 (Path 1)...";
					local v1 = print("[DOJO] Planting Rafflesia 1 (Path 1)...");
					while true do
						v0 = items_5_ref();
						v1 = 1250;
						if not (v0 < 1250) then
							break;
						end;
						while true do
							v1 = items_7_ref();
							if v1 then
								break;
							end;
							task.wait(.2);
						end;
						return hzqMP0RaHbBDRe;
					end;
					v1 = v29;
					local message = "o\177\248\0307\196J\167\150\021I";
					local n4 = 31779563698638;
					local callback_fn_10_ref_3_ref_2 = callback_fn_10_ref_3;
					local n5 = 10;
					v0 = v29(callback_fn_5_ref, "Rafflesia 1", 10);
					local v2 = not v0;
					if not v0 then
						return rkTO4QUk4pIa9;
					else
						v0 = 0;
						v2 = 5;
						callback_fn_10_ref_3_ref_2 = 1;
						v1 = #unit_i_ds < 1;
						while #unit_i_ds < 1 do
							while true do
								v1 = items_7_ref();
								if v1 then
									break;
								end;
								task.wait(.2);
							end;
							return etu1KA30MIeuwS;
						end;
						n5 = 1;
						v1 = #unit_i_ds < 1;
						if #unit_i_ds < 1 then
							v1("[DOJO] Failed to track Rafflesia 1 after " .. (v0  .. " seconds!"));
							return v1;
						else
							n3 = 17604283064325;
							print("[DOJO] \226\156\147 Rafflesia 1 tracked successfully (ID: " .. (unit_i_ds[1] .. ")"));
							v1 = print;
							callback_fn_10_ref_3_ref_2 = "[DOJO] Planting Rafflesia 2 (Path 2)...";
							n5 = print("[DOJO] Planting Rafflesia 2 (Path 2)...");
							while true do
								callback_fn_10_ref_3_ref_2 = items_5_ref();
								n5 = 1250;
								v1 = callback_fn_10_ref_3_ref_2 < 1250;
								if not (callback_fn_10_ref_3_ref_2 < 1250) then
									break;
								end;
								while true do
									n5 = items_7_ref();
									if n5 then
										break;
									end;
									task.wait(.2);
								end;
								return v1;
							end;
							callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							n2 = 14692957592249;
							n1 = 14692957592249;
							message = "Rafflesia 2";
							n4 = 10;
							callback_fn_10_ref_3_ref_2 = v29(callback_fn_3_ref, "Rafflesia 2", 10);
							v1 = not callback_fn_10_ref_3_ref_2;
							if not callback_fn_10_ref_3_ref_2 then
								v1.Notify(v1, { Title = "Dojo Error", Content = "Failed to plant Rafflesia 2 after 10 attempts", Duration = 5 });
								return v1;
							else
								v0 = 0;
								callback_fn_10_ref_3_ref_2 = v2;
								n4 = 2;
								while #unit_i_ds < 2 do
									while true do
										callback_fn_10_ref_3_ref_2 = items_7_ref();
										if callback_fn_10_ref_3_ref_2 then
											break;
										end;
										task.wait(.2);
									end;
									warn("[DOJO] Game ended before tracking Rafflesia 2");
									return false;
								end;
								message = 2;
								if #unit_i_ds < 2 then
									warn("[DOJO] Failed to track Rafflesia 2 after " .. (v0  .. " seconds!"));
									return false;
								else
									print("[DOJO] \226\156\147 Rafflesia 2 tracked successfully (ID: " .. (unit_i_ds[2] .. ")"));
									n4 = "[DOJO] Upgrading Rafflesia 1...";
									message = print("[DOJO] Upgrading Rafflesia 1...");
									while true do
										n4 = items_5_ref();
										message = 8000;
										if not (n4 < 8000) then
											break;
										end;
										while true do
											message = items_7_ref();
											if message then
												break;
											end;
											task.wait(.2);
										end;
										return false;
									end;
									n4 = function(arg1, arg2, arg3)
											local v0;
											v0.WaitForChild(v0, "UpgradeUnit");
											return;
										end;
									pcall(n4);
									n2 = math.random();
									task.wait(.28 + n2 * .41);
									n4 = "[DOJO] Upgrading Rafflesia 2...";
									message = print("[DOJO] Upgrading Rafflesia 2...");
									while true do
										n4 = items_5_ref();
										message = 8000;
										if not (n4 < 8000) then
											break;
										end;
										while true do
											message = items_7_ref();
											if message then
												break;
											end;
											task.wait(.2);
										end;
										return false;
									end;
									n4 = function(arg1, arg2)
											local v0;
											v0.WaitForChild(v0, "UpgradeUnit");
											return;
										end;
									pcall(n4);
									n3 = v35_ref;
									n2 = math.random();
									task.wait(.28 + n2 * .41);
									n2 = "?\221yK\145\165\180C\189\145\029n\233\191\251\023\133\022O\165P\177\138\140\244\170\167[\229#\r,\150h>\245*\020j\240su\180{\142\141\022\131)\008\206\1785:\13780\227I\023\225\138\163\232\2177\015U\133\162\148|";
									print("[DOJO] ========== ALL UPGRADES COMPLETE - WAITING FOR WAVE 10 ==========");
									flag = false;
									callback_fn_10_ref_3_ref = v2;
									n1 = true;
									getgenv();
									while true do
										while true do
											callback_fn_10_ref_3_ref = items_7_ref();
											if callback_fn_10_ref_3_ref then
												break;
											end;
											while true do
												n1 = function(arg1, arg2, arg3, arg4)
														local callback_fn_10_ref_3_ref, message;
														local message_2 = "\004S\135\243\129\218uIS\245\189\177\031\175";
														local n1 = 12684955866898;
														local v35_ref_ref = v35_ref;
														local game_gui_no_inset = n3:FindFirstChild("GameGuiNoInset");
														local game_gui_no_inset_ref = game_gui_no_inset;
														if not game_gui_no_inset then
															n3.FindFirstChild(n3, "GameGui");
														end;
														local game_gui_no_inset_ref_ref = game_gui_no_inset_ref;
														if game_gui_no_inset_ref then
															v35_ref_ref = { game_gui_no_inset_ref_ref:GetDescendants() };
															for key, value in pairs((unpack or table.unpack)(v35_ref_ref)) do
																callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
																message = "TextLabel";
																n1 = value:IsA("TextLabel");
																message_2 = n1;
																if n1 then
																	message = tonumber;
																	callback_fn_10_ref_3_ref = string.match(value.Text, "^Wave%s*(%d+)");
																	n1 = callback_fn_10_ref_3_ref;
																	if not callback_fn_10_ref_3_ref then
																		string.match(value.Text, "Wave%s*(%d+)%s*/");
																	end;
																	message_2 = message(n1);
																	if message_2 then
																		while not (message_2 >= 10) do
 
																		end;
																		print("[DOJO] \226\156\147\226\156\147\226\156\147 WAVE 10 REACHED! \226\156\147\226\156\147\226\156\147");
																		return;
																	end;
																end;
															end;
															return;
														end;
													end;
												pcall(n1);
												if flag then
													break;
												end;
												task.wait(.5);
											end;
											n2 = getgenv();
											n1 = n2.AutoFarmConfig;
											n3 = 30036417263266;
											callback_fn_10_ref_3_ref = n2.AutoFarmConfig.DojoActive;
											if not n2.AutoFarmConfig.DojoActive then
												print("[DOJO] Farm stopped by user");
												return false;
											else
												callback_fn_10_ref_3_ref = items_7_ref();
												if callback_fn_10_ref_3_ref then
													warn("[DOJO] \226\156\133 Game ended - continuing to next match");
													return true;
												else
													if not flag then
														warn("[DOJO] Wave 10 not detected but continuing");
														return true;
													else
														print("[DOJO] ========== WAVE 10 REACHED - SELLING UNITS ==========");
														n3 = math.random();
														task.wait(.35 + n3 * .35);
														n1 = function(arg1, arg2, arg3, arg4, arg5)
																local v0;
																v0.WaitForChild(v0, "SellUnit");
																return;
															end;
														pcall(n1);
														task.wait(.05);
														n1 = function(arg1, arg2, arg3, arg4, arg5)
																local v0;
																v0.WaitForChild(v0, "SellUnit");
																return;
															end;
														pcall(n1);
														print("[DOJO] ========== SELL COMPLETE ==========");
														return true;
													end;
												end;
											end;
										end;
										warn("[DOJO] \226\156\133 Game ended before Wave 10 - continuing to next match");
										return true;
									end;
								end;
							end;
						end;
					end;
				end;
			v22 = function(arg1)
					local v0;
					getgenv();
					local callback_fn = function(arg1, arg2)
							local v0, n1, v1, n2, auto_farm_config, v2, n3, n4, auto_farm_config_2, graveyard_v1active, n5, n6, n7, n8, n9, n10;
							if arg1 then
								v1 = getgenv();
								auto_farm_config_2 = v1.AutoFarmConfig;
								n1 = 9629315846532;
								n3 = 9629315846532;
								graveyard_v1active = v1.AutoFarmConfig.GraveyardV1Active;
								if not v1.AutoFarmConfig.GraveyardV1Active then
									n3 = getgenv();
									n5 = 1293321355866;
									n1 = 1293321355866;
									if not n3.AutoFarmConfig.GraveyardV2Active then
										n1 = getgenv();
										n5 = 3801685444330;
										if not n1.AutoFarmConfig.DojoActive then
											n5 = getgenv();
											if not n5.AutoFarmConfig.AutoWinV1Active then
												getgenv();
											end;
										end;
									end;
								end;
								if graveyard_v1active then
									return;
								else
									message_2();
									auto_farm_config_2 = function(arg1, arg2, arg3)
											local v0 = items_2_ref("map_christmas", "Christmas", 10);
											if v0 then
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Complete", Content = "Successfully entered Christmas map!", Duration = 3 });
											else
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Failed", Content = "Could not enter Christmas map. Please try manually.", Duration = 5 });
											end;
											return;
										end;
									auto_farm_config_2 = ("map_lobby")();
									auto_farm_config_2.map_lobby.map_lobby = false;
									return;
								end;
							else
								v0 = getgenv();
								v0.AutoFarmConfig.WinterActive = false;
								v0 = getgenv();
								v0.AutoFarmConfig.IsRunning = false;
								v2 = getgenv();
								auto_farm_config = v2.AutoFarmConfig;
								n2 = 4025462884178;
								v2 = v35_ref;
								n4 = 4025462884178;
								graveyard_v1active = not auto_farm_config.GraveyardV1Active;
								if not auto_farm_config.GraveyardV1Active then
									n4 = getgenv();
									n6 = 33349383584937;
									v2 = n4.AutoFarmConfig;
									n4 = v35_ref;
									n2 = 33349383584937;
									if not v2.GraveyardV2Active then
										n2 = getgenv();
										n7 = 9023320330345;
										n4 = n2.AutoFarmConfig;
										n6 = 9023320330345;
										if not n4.DojoActive then
											n6 = getgenv();
											n8 = 33164242746451;
											n7 = 33164242746451;
											if not n6.AutoFarmConfig.AutoWinV1Active then
												n7 = getgenv();
												n9 = 10567362925368;
												n8 = 10567362925368;
												if not n7.AutoFarmConfig.AutoWinV2Active then
													n8 = getgenv();
													n10 = 34333151215219;
													n9 = 34333151215219;
													if not n8.AutoFarmConfig.WinterActive then
														n9 = getgenv();
														n10 = 33597588995357;
														if not n9.AutoFarmConfig.AutoWinV1Active then
															n10 = getgenv();
															if not n10.AutoFarmConfig.AutoWinV2Active then
																getgenv();
															end;
														end;
													end;
												end;
											end;
										end;
									end;
								end;
								if graveyard_v1active then
									graveyard_v1active = getgenv();
									graveyard_v1active.NoahHubLocked = false;
								end;
								v0 = { Title = "Winter Stopped", Content = "Auto farm disabled", Duration = 2 };
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, v0);
							end;
						end;
					local v1 = v0();
					v1[v0][v0] = v0;
					getgenv();
					local callback_fn_2 = function(arg1, arg2, arg3)
							local v0, v1, n1, auto_farm_config, n2, v2, n3, n4, auto_farm_config_2, graveyard_v1active, n5, n6, n7, n8, n9, n10;
							if arg1 then
								v1 = getgenv();
								n1 = 9993576419885;
								auto_farm_config_2 = v1.AutoFarmConfig;
								n3 = 9993576419885;
								graveyard_v1active = auto_farm_config_2.GraveyardV1Active;
								if not auto_farm_config_2.GraveyardV1Active then
									n3 = getgenv();
									n5 = 32217267419802;
									n1 = 32217267419802;
									if not n3.AutoFarmConfig.GraveyardV2Active then
										n1 = getgenv();
										n7 = 1991669056415;
										n5 = 1991669056415;
										if not n1.AutoFarmConfig.WinterActive then
											n5 = getgenv();
											n9 = 18017812586694;
											n7 = 18017812586694;
											if not n5.AutoFarmConfig.DojoActive then
												n7 = getgenv();
												n9 = 24093481528275;
												if not n7.AutoFarmConfig.AutoWinV1Active then
													n9 = getgenv();
													if not n9.AutoFarmConfig.AutoWinV2Active then
														getgenv();
													end;
												end;
											end;
										end;
									end;
								end;
								if graveyard_v1active then
									return;
								else
									message_2();
									auto_farm_config_2 = function(arg1, arg2, arg3, arg4, arg5)
											local v0 = items_2_ref("map_space", "Space", 10);
											if v0 then
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Complete", Content = "Successfully entered Space map!", Duration = 3 });
											else
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Failed", Content = "Could not enter Space map. Please try manually.", Duration = 5 });
											end;
											return;
										end;
									auto_farm_config_2 = ("map_lobby")();
									auto_farm_config_2.map_lobby.map_lobby = false;
									return;
								end;
							else
								v0 = getgenv();
								v0.AutoFarmConfig.SpaceV1Active = false;
								v0 = getgenv();
								v0.AutoFarmConfig.IsRunning = false;
								v2 = getgenv();
								auto_farm_config = v2.AutoFarmConfig;
								n2 = 65725956126;
								n4 = 65725956126;
								graveyard_v1active = not auto_farm_config.GraveyardV1Active;
								if not auto_farm_config.GraveyardV1Active then
									n4 = getgenv();
									n6 = 14420303845946;
									n2 = 14420303845946;
									if not n4.AutoFarmConfig.GraveyardV2Active then
										n2 = getgenv();
										n8 = 21366230279901;
										n6 = 21366230279901;
										if not n2.AutoFarmConfig.WinterActive then
											n6 = getgenv();
											n10 = 28111190324002;
											n8 = 28111190324002;
											if not n6.AutoFarmConfig.DojoActive then
												n8 = getgenv();
												n10 = 26408958652425;
												if not n8.AutoFarmConfig.AutoWinV1Active then
													n10 = getgenv();
													if not n10.AutoFarmConfig.AutoWinV2Active then
														getgenv();
													end;
												end;
											end;
										end;
									end;
								end;
								if graveyard_v1active then
									graveyard_v1active = getgenv();
									graveyard_v1active.NoahHubLocked = false;
								end;
								v0 = { Title = "Space V1 Stopped", Content = "Auto farm disabled", Duration = 2 };
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, v0);
							end;
						end;
					local v2 = v0();
					v2[v0][v0] = v0;
					getgenv();
					local callback_fn_3 = function(arg1, arg2, arg3, arg4)
							local v0, n1, v1, auto_farm_config, v2, n2, n3, n4, auto_farm_config_2, graveyard_v1active, n5, n6, n7, n8, n9, n10;
							if arg1 then
								v1 = getgenv();
								n2 = 31403969427743;
								auto_farm_config_2 = v1.AutoFarmConfig;
								n3 = 31403969427743;
								graveyard_v1active = auto_farm_config_2.GraveyardV1Active;
								if not auto_farm_config_2.GraveyardV1Active then
									n3 = getgenv();
									n6 = 19515635606399;
									n2 = 19515635606399;
									if not n3.AutoFarmConfig.GraveyardV2Active then
										n2 = getgenv();
										n8 = 3689497265846;
										n6 = 3689497265846;
										if not n2.AutoFarmConfig.WinterActive then
											n6 = getgenv();
											n10 = 19189658591975;
											n8 = 19189658591975;
											if not n6.AutoFarmConfig.DojoActive then
												n8 = getgenv();
												n10 = 23984136940448;
												if not n8.AutoFarmConfig.AutoWinV1Active then
													n10 = getgenv();
													if not n10.AutoFarmConfig.AutoWinV2Active then
														getgenv();
													end;
												end;
											end;
										end;
									end;
								end;
								if graveyard_v1active then
									return;
								else
									message_2();
									auto_farm_config_2 = function(arg1, arg2, arg3, arg4, arg5)
											local v0 = items_2_ref("map_space", "Space", 10);
											if v0 then
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Complete", Content = "Successfully entered Space map!", Duration = 3 });
											else
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Failed", Content = "Could not enter Space map. Please try manually.", Duration = 5 });
											end;
											return;
										end;
									auto_farm_config_2 = ("map_lobby")();
									auto_farm_config_2.map_lobby.map_lobby = false;
									return;
								end;
							else
								v0 = getgenv();
								v0.AutoFarmConfig.SpaceV2Active = false;
								v0 = getgenv();
								v0.AutoFarmConfig.IsRunning = false;
								v2 = getgenv();
								auto_farm_config = v2.AutoFarmConfig;
								n1 = 9633110069637;
								n4 = 9633110069637;
								graveyard_v1active = not auto_farm_config.GraveyardV1Active;
								if not auto_farm_config.GraveyardV1Active then
									n4 = getgenv();
									n5 = 5477823236598;
									n1 = 5477823236598;
									if not n4.AutoFarmConfig.GraveyardV2Active then
										n1 = getgenv();
										n7 = 9388276322579;
										n5 = 9388276322579;
										if not n1.AutoFarmConfig.WinterActive then
											n5 = getgenv();
											n9 = 13810033301790;
											n7 = 13810033301790;
											if not n5.AutoFarmConfig.DojoActive then
												n7 = getgenv();
												n9 = 28229445333849;
												if not n7.AutoFarmConfig.AutoWinV1Active then
													n9 = getgenv();
													if not n9.AutoFarmConfig.AutoWinV2Active then
														getgenv();
													end;
												end;
											end;
										end;
									end;
								end;
								if graveyard_v1active then
									graveyard_v1active = getgenv();
									graveyard_v1active.NoahHubLocked = false;
								end;
								v0 = { Title = "Space V2 Stopped", Content = "Auto farm disabled", Duration = 2 };
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, v0);
							end;
						end;
					local v3 = v0();
					v3[v0][v0] = v0;
					getgenv();
					local callback_fn_4 = function(arg1, arg2, arg3, arg4, arg5)
							local v0, n1, v1, n2, v2, n3, n4, auto_farm_config, graveyard_v1active;
							if arg1 then
								v1 = getgenv();
								auto_farm_config = v1.AutoFarmConfig;
								n1 = 27912976495301;
								n3 = 27912976495301;
								graveyard_v1active = v1.AutoFarmConfig.GraveyardV1Active;
								if not v1.AutoFarmConfig.GraveyardV1Active then
									n3 = getgenv();
									n1 = 23817273928530;
									if not n3.AutoFarmConfig.DojoActive then
										n1 = getgenv();
										if not n1.AutoFarmConfig.AutoWinV1Active then
											getgenv();
										end;
									end;
								end;
								if graveyard_v1active then
									return;
								else
									message_2();
									auto_farm_config = function(arg1)
											local v0 = items_2_ref("map_graveyard", "Graveyard", 10);
											if v0 then
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Complete", Content = "Successfully entered Graveyard map!", Duration = 3 });
											else
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Failed", Content = "Could not enter Graveyard after 10 attempts. Please try manually.", Duration = 5 });
											end;
											return;
										end;
									auto_farm_config = ("map_lobby")();
									auto_farm_config.map_lobby.map_lobby = false;
									return;
								end;
							else
								v0 = getgenv();
								v0.AutoFarmConfig.GraveyardV2Active = false;
								v0 = getgenv();
								v0.AutoFarmConfig.IsRunning = false;
								v2 = getgenv();
								n2 = 1207362847282;
								n4 = 1207362847282;
								graveyard_v1active = not v2.AutoFarmConfig.GraveyardV1Active;
								if not v2.AutoFarmConfig.GraveyardV1Active then
									n4 = getgenv();
									n2 = 29339250488670;
									if not n4.AutoFarmConfig.DojoActive then
										n2 = getgenv();
										if not n2.AutoFarmConfig.AutoWinV1Active then
											getgenv();
										end;
									end;
								end;
								if graveyard_v1active then
									graveyard_v1active = getgenv();
									graveyard_v1active.NoahHubLocked = false;
								end;
								v0 = { Title = "Graveyard V2 Stopped", Content = "Auto farm disabled", Duration = 2 };
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, v0);
							end;
						end;
					local v4 = v0();
					v4[v0][v0] = v0;
					getgenv();
					local callback_fn_5 = function(arg1, arg2, arg3, arg4, arg5)
							local v0, v1, v2, auto_farm_config;
							if arg1 then
								v0 = getgenv();
								auto_farm_config = v0.AutoFarmConfig;
								v0 = v35_ref;
								if auto_farm_config.GraveyardV1Active then
									return;
								else
									message_2();
									v0 = function(arg1, arg2, arg3)
											local v0 = items_2_ref("map_dojo", "Dojo", 10);
											if v0 then
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Complete", Content = "Successfully entered Dojo map!", Duration = 3 });
											else
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Failed", Content = "Could not enter Dojo after 10 attempts. Please try manually.", Duration = 5 });
											end;
											return;
										end;
									v0 = ("map_lobby")();
									v0.map_lobby.map_lobby = false;
									return;
								end;
							else
								v1 = getgenv();
								v1.AutoFarmConfig.DojoActive = false;
								v1 = getgenv();
								v1.AutoFarmConfig.IsRunning = false;
								v1 = getgenv();
								v1.AutoFarmConfig.CurrentStrategy = nil;
								v1 = getgenv();
								v1.AutoFarmConfig.FirstRunComplete = false;
								v2 = getgenv();
								auto_farm_config = v2.AutoFarmConfig.GraveyardV1Active;
								if not v2.AutoFarmConfig.GraveyardV1Active then
									auto_farm_config = getgenv();
									auto_farm_config.NoahHubLocked = false;
									print("[NOAH HUB] All farms stopped - script unlocked");
								end;
								v1 = { Title = "Dojo Stopped", Content = "Auto farm has been disabled", Duration = 2 };
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, v1);
								print("[AUTO FARM] Dojo deactivated");
							end;
						end;
					local v5 = v0();
					v5[v0][v0] = v0;
					getgenv();
					local callback_fn_6 = function(arg1, arg2, arg3, arg4, arg5, arg6)
							local v0, v1, v2, n1, n2, auto_farm_config, graveyard_v1active;
							if arg1 then
								v1 = getgenv();
								auto_farm_config = v1.AutoFarmConfig;
								n1 = 29542724122044;
								graveyard_v1active = v1.AutoFarmConfig.GraveyardV1Active;
								if not v1.AutoFarmConfig.GraveyardV1Active then
									n1 = getgenv();
									if not n1.AutoFarmConfig.DojoActive then
										getgenv();
									end;
								end;
								if graveyard_v1active then
									return;
								else
									message_2();
									auto_farm_config = function(arg1, arg2)
											local v0 = items_2_ref("map_farm", "Garden", 10);
											if v0 then
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Complete", Content = "Successfully entered Garden map!", Duration = 3 });
											else
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Failed", Content = "Could not enter Garden after 10 attempts. Please try manually.", Duration = 5 });
											end;
											return;
										end;
									auto_farm_config = ("map_lobby")();
									auto_farm_config.map_lobby.map_lobby = false;
									return;
								end;
							else
								v0 = getgenv();
								v0.AutoFarmConfig.AutoWinV1Active = false;
								v0 = getgenv();
								v0.AutoFarmConfig.IsRunning = false;
								v0 = getgenv();
								v0.AutoFarmConfig.CurrentStrategy = nil;
								v0 = getgenv();
								v0.AutoFarmConfig.FirstRunComplete = false;
								v2 = getgenv();
								n2 = 17730543099968;
								graveyard_v1active = not v2.AutoFarmConfig.GraveyardV1Active;
								if not v2.AutoFarmConfig.GraveyardV1Active then
									n2 = getgenv();
									if not n2.AutoFarmConfig.DojoActive then
										getgenv();
									end;
								end;
								if graveyard_v1active then
									graveyard_v1active = getgenv();
									graveyard_v1active.NoahHubLocked = false;
									print("[NOAH HUB] All farms stopped - script unlocked");
								end;
								v0 = { Title = "Auto Win V1 Stopped", Content = "Auto farm has been disabled", Duration = 2 };
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, v0);
								print("[AUTO FARM] Auto Win V1 deactivated");
							end;
						end;
					local v6 = v0();
					v6[v0][v0] = v0;
					getgenv();
					local callback_fn_7 = function(arg1, arg2, arg3)
							local v0, v1, v2, n1, n2, auto_farm_config, graveyard_v1active;
							if arg1 then
								v1 = getgenv();
								auto_farm_config = v1.AutoFarmConfig;
								n1 = 32190584781453;
								graveyard_v1active = v1.AutoFarmConfig.GraveyardV1Active;
								if not v1.AutoFarmConfig.GraveyardV1Active then
									n1 = getgenv();
									if not n1.AutoFarmConfig.DojoActive then
										getgenv();
									end;
								end;
								if graveyard_v1active then
									return;
								else
									message_2();
									auto_farm_config = function()
											local v0 = items_2_ref("map_farm", "Garden", 10);
											if v0 then
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Complete", Content = "Successfully entered Garden map!", Duration = 3 });
											else
												callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Setup Failed", Content = "Could not enter Garden after 10 attempts. Please try manually.", Duration = 5 });
											end;
											return;
										end;
									auto_farm_config = ("map_lobby")();
									auto_farm_config.map_lobby.map_lobby = false;
									return;
								end;
							else
								v0 = getgenv();
								v0.AutoFarmConfig.AutoWinV2Active = false;
								v0 = getgenv();
								v0.AutoFarmConfig.IsRunning = false;
								v0 = getgenv();
								v0.AutoFarmConfig.CurrentStrategy = nil;
								v0 = getgenv();
								v0.AutoFarmConfig.FirstRunComplete = false;
								v2 = getgenv();
								n2 = 4018547443535;
								graveyard_v1active = not v2.AutoFarmConfig.GraveyardV1Active;
								if not v2.AutoFarmConfig.GraveyardV1Active then
									n2 = getgenv();
									if not n2.AutoFarmConfig.DojoActive then
										getgenv();
									end;
								end;
								if graveyard_v1active then
									graveyard_v1active = getgenv();
									graveyard_v1active.NoahHubLocked = false;
									print("[NOAH HUB] All farms stopped - script unlocked");
								end;
								v0 = { Title = "Auto Win V2 Stopped", Content = "Auto farm has been disabled", Duration = 2 };
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, v0);
								print("[AUTO FARM] Auto Win V2 deactivated");
							end;
						end;
					local v7 = v0();
					v7[v0][v0] = v0;
					return;
				end;
			task.spawn(v22);
			v22 = function(arg1, arg2, arg3, arg4)
					local v0;
					local v1 = nil;
					local items = {
							[v0] = nil,
							SelectedCrateName = nil,
							BuyType = nil,
							BuyAmount = nil,
							IsRunning = false,
							AutoDeleteEnabled = false,
						};
					local items_ref = items;
					items = {
							[v0] = {
								"unit_cactus",
								"unit_tomato_plant",
								"unit_farmer_npc",
								"unit_gnome_npc",
								"unit_potato",
								"unit_pineapple",
								"unit_mushroom",
								"unit_chili_pepper",
								"unit_money_tree",
								"unit_bamboo",
								"unit_roses",
								"unit_carrots",
								"unit_palm_tree",
								"unit_broccoli",
								"unit_peas",
								"unit_watermelon",
								"unit_sunflower",
							},
							ub_jungle = {
								"unit_onion",
								"unit_strawberry",
								"unit_pumpkin",
								"unit_ghost_pepper",
								"unit_pak_choi",
								"unit_laser_plant",
							},
							ub_sun = {
								"unit_razor",
								"unit_eggplant",
								"unit_durian",
								"unit_sound_plant",
								"unit_sprinkler",
							},
							ub_astral = {
								"unit_stun_root",
								"unit_daisy",
								"unit_accumulator",
								"unit_cauliflower",
								"unit_ufo",
							},
							ub_crystal = {
								"unit_dragonfruit",
								"unit_slap_leaf",
								"unit_hammer",
								"unit_glow_fruit",
								"unit_magic_pot",
							},
							ub_tropical = {
								"unit_radish",
								"unit_scarecrow",
								"unit_kiwi_cannon",
								"unit_grandma",
								"unit_umbra",
								"unit_lawnmower",
							},
							ub_bee = {
								"unit_pomegranate",
								"unit_aloe_vera",
								"unit_venus_floortrap",
								"unit_fruit_lobber",
								"unit_worker",
							},
							ub_corrupted = {
								"unit_lumberjack",
								"unit_whip_plant",
								"unit_drill",
								"unit_fairy",
								"unit_blackberries",
							},
							ub_mushroom = {
								"unit_pine",
								"unit_drill_head",
								"unit_pea_lobber",
								"unit_grenade_lobber",
								"unit_scent_flower",
							},
							ub_christmas = {
								"unit_christmas_tree",
								"unit_ice_chomp",
								"unit_wheel_bush",
								"unit_snowballer",
								"unit_frost_shroom",
							},
							ub_greenhouse = {
								"unit_clawfruit",
								"unit_vine_guy",
								"unit_multi_boom",
								"unit_cannoneer",
								"unit_stem_blast",
							},
							ub_space = {
								"unit_robo_stem",
								"unit_electric_jabber",
								"unit_cyborg_farmer",
								"unit_tri_orb",
								"unit_alien_plant",
							},
							ub_easter = {
								"unit_lily",
								"unit_egg_catapult",
								"unit_bunny",
								"unit_bunny_flower",
								"unit_icecream",
							},
						};
					local items_ref_2 = items;
					items = ;
					local items_ref_3 = items;
					items = function(arg1, arg2, arg3, arg4, arg5)
							local n1;
							local v0 = arg1;
							local v1 = items_ref_2[arg1];
							if not (not items_ref_2[arg1]) then
								return;
							else
								n1 = 4038899058520;
								print("[AUTO DELETE] Removing bans for: " .. v0);
								for _, value in ipairs(v1) do
									r35 = function(arg1, arg2)
											local v0;
											v0.WaitForChild(v0, "RemoteEvents");
											v0.FireServer(v0, unpack({ v0, n1, false }));
											return;
										end;
									pcall(4038899058520);
									task.wait(.05);
								end;
								print("[AUTO DELETE] \226\156\147 Removed all bans from " .. v0);
								return;
							end;
						end;
					local items_ref_4 = items;
					items = {
							[v0] = "ub_classic_v10",
							["Enchanted Summon"] = "ub_jungle",
							["Sun Summon"] = "ub_sun",
							["Astral Summon"] = "ub_astral",
							["Crystal Summon"] = "ub_crystal",
							["Tropical Summon"] = "ub_tropical",
							["Bee Summon"] = "ub_bee",
							["Corrupted Summon"] = "ub_corrupted",
							["Mushroom Summon"] = "ub_mushroom",
							["Winter Summon"] = "ub_christmas",
							["Green House Summon"] = "ub_greenhouse",
							["Galaxy Summon"] = "ub_space",
							["Bunny Summon"] = "ub_easter",
						};
					local items_ref_5 = items;
					local callback_fn = function(arg1, arg2, arg3)
							local v0;
							items_ref[v0] = arg1.Title;
							items_ref[v0] = items_ref_5[arg1.Title];
							local v1 = (getfenv and getfenv() or _ENV)[v0];
							return;
						end;
					local callback_fn_2 = function(arg1)
							local title = arg1.Title;
							if arg1.Title == "Buy 1" then
								items_ref.BuyType = 1;
							else
								items_ref.BuyType = 10;
							end;
							local v0 = (getfenv and getfenv() or _ENV)[title];
							return;
						end;
					local callback_fn_3 = function(arg1, arg2, arg3, arg4, arg5, arg6)
							local v35_ref_ref = v35_ref;
							local v0 = arg1;
							local v1 = callback_fn_10_ref_3("", 24974821223789);
							local v2 = arg1 == v35_ref[v1];
							local v3 = arg1 == v35_ref[v1];
							if arg1 == v35_ref[v1] then
								items_ref[v3] = nil;
								return;
							else
								v3 = tonumber(v0);
								v2 = v3;
								v3 = v3;
								if v3 then
									v35_ref_ref = math.floor(v2);
									items_ref.BuyAmount = v35_ref_ref;
									BuyAmountInput.Highlight(BuyAmountInput);
								else
									items_ref.BuyAmount = nil;
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Invalid Amount", Content = "Please enter a valid number greater than 0", Duration = 3 });
								end;
								return;
							end;
						end;
					local callback_fn_4 = function(arg1, arg2)
							items_ref.AutoDeleteEnabled = arg1;
							if arg1 then
								if items_ref.SelectedCrate then
									items_ref_3(items_ref.SelectedCrate);
								end;
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Delete Enabled", Content = "Non-Godly units will be deleted automatically", Duration = 3 });
							else
								if items_ref.SelectedCrate then
									items_ref_4(items_ref.SelectedCrate);
								end;
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Delete Disabled", Content = "All units will be kept", Duration = 2 });
							end;
							return;
						end;
					local callback_fn_5 = function(arg1, arg2, arg3, arg4, arg5)
							local v0 = arg1;
							items_ref.IsRunning = arg1;
							if arg1 then
								v0 = items_ref;
								if not items_ref.SelectedCrate then
									return;
								else
									v0 = items_ref;
									if not items_ref.BuyType then
										return;
									else
										v0 = not items_ref.BuyAmount;
										if not items_ref.BuyAmount then
											return;
										else
											v0 = { Title = "Auto Summon Started", Content = "Buying " .. (items_ref.BuyAmount .. ("x " .. (items_ref.BuyType .. (" of " .. items_ref.SelectedCrateName)))), Duration = 3 };
											callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, v0);
											v1.Highlight(v1);
											v0 = "AutoDeleteEnabled";
											if items_ref.AutoDeleteEnabled then
												v0 = function(arg1)
														return;
													end;
												task.spawn(v0);
											end;
											v0 = function(arg1, arg2)
													local callback_fn, v0, values;
													local message = "\005~@\016AL=4\166";
													local n1 = 0;
													local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
													for i = 1, items_ref.BuyAmount, 1 do
														while true do
															callback_fn_10_ref_3_ref = i;
															if not items_ref.IsRunning then
																break;
															end;
															callback_fn = function()
																	local unpack_fn_7 = unpack or table.unpack;
																	local v0;
																	v0.WaitForChild(v0, "RemoteFunctions");
																	local items = { unpack({ v0, items_ref.BuyType }) };
																	local items_2 = { v0:InvokeServer(unpack_fn_7(items)) };
																	return unpack_fn_7(nil);
																end;
															values = { pcall(callback_fn) };
															message = values[2];
															while values[1] do
																print("[AUTO SUMMON] \226\156\147 Purchase " .. (callback_fn_10_ref_3_ref .. ("/" .. (items_ref.BuyAmount .. " completed"))));
																task.wait(.5);
															end;
															v0 = tostring(message);
															warn("[AUTO SUMMON] \226\156\151 Purchase failed: " .. v0);
															items_ref.IsRunning = false;
															v1.Set(v1, false);
															callback_fn = { Title = "Auto Summon Stopped", Content = "You broke or your inventory is full!", Duration = 5 };
															callback_fn_10_ref_2:Notify(callback_fn);
															if items_ref.IsRunning then
																items_ref.IsRunning = false;
																v1.Set(v1, false);
																callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Summon Completed", Content = "Successfully bought " .. (n1  .. ("x " .. (items_ref.BuyType .. (" of " .. items_ref.SelectedCrateName)))), Duration = 2 });
															end;
															return;
														end;
														callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Summon Stopped", Content = "Completed " .. (n1  .. (" out of " .. items_ref.BuyAmount)), Duration = 3 });
													end;
												end;
											task.spawn(v0);
											return;
										end;
									end;
								end;
							else
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Summon Stopped", Content = "Summoning has been stopped", Duration = 2 });
							end;
						end;
					print("[SUMMON TAB] Content loaded!");
					return;
				end;
			task.spawn(v22);
			v22 = function(arg1, arg2, arg3)
					local v0;
					local v0_ref = v0;
					local v0_ref_2 = v0;
					local callback_fn = function(arg1, arg2, arg3, arg4)
							local v0, v1, v2, v3;
							local callback_fn = function(arg1, arg2, arg3, arg4)
									local unpack_fn = unpack or table.unpack;
									local v35_ref_ref;
									print("[SERVER HOP] Starting server hop...");
									print("[SERVER HOP] Looking for servers with " .. (v1  .. ("-" .. (v0  .. " players"))));
									local place_id = game.PlaceId;
									local v0 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", game.PlaceId);
									v0 = game:HttpGet(v0);
									v0 = v0_ref_2:JSONDecode(v0);
									local v0_ref = v0;
									v0 = not v0;
									if not v0 then
										v36("Failed to fetch server list");
									end;
									print("[SERVER HOP] Total servers found: " .. #v0_ref.data);
									local lookup = {};
									for key, value in pairs(v0_ref.data) do
										v35_ref_ref = v35_ref;
										if callback_fn_10_ref_3 then
											v35_ref_ref = (22160486770767)("Iq\212yT\023", 12422232905368);
											callback_fn_10_ref_3[("VE\198G")[v35_ref_ref]](lookup, value);
										end;
									end;
									print("[SERVER HOP] Valid servers in range: " .. #lookup);
									if #lookup == 0 then
										v36("No servers found with " .. (v1  .. ("-" .. (v0  .. " players"))));
									end;
									local callback_fn = function(arg1, arg2, arg3, arg4, arg5)
											return dMMsW6WkZ8EJ;
										end;
									table.sort(lookup, callback_fn);
									local n1 = 31314758629622;
									print("[SERVER HOP] Available servers:");
									math.min(5, #lookup);
									for i = 1, math.min(5, #lookup), 1 do
										n1 = { string.format("  %d. Players: %d/%d", i, lookup[i].playing, lookup[i].maxPlayers) };
										print(unpack_fn(n1));
									end;
									local items = { math.min(10, #lookup) };
									callback_fn = math.random(1, unpack_fn(items));
									print("[SERVER HOP] Selected server with " .. (lookup[callback_fn].playing .. " players"));
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Server Hop", Content = "Teleporting to server with " .. (lookup[callback_fn].playing .. " players..."), Duration = 2 });
									v0_ref.TeleportToPlaceInstance(v0_ref, place_id, lookup[callback_fn].id, items_12_ref);
									print("[SERVER HOP] Teleport initiated");
									return;
								end;
							local values = { pcall(callback_fn) };
							local v4 = values[2];
							if not pcall(callback_fn) then
								v2 = tostring(v4);
								warn("[SERVER HOP] ERROR: " .. v2);
								v3 = tostring(v4);
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Server Hop Failed", Content = v3, Duration = 5 });
							end;
							return;
						end;
					local callback_fn_2 = function(arg1)
							local v0;
							local v1 = (getfenv and getfenv() or _ENV)[v0];
							local callback_fn = function(arg1)
									return;
								end;
							return;
						end;
					callback_fn_2 = function(arg1, arg2, arg3)
							local v0;
							local v1 = (getfenv and getfenv() or _ENV)[v0];
							local callback_fn = function()
									return;
								end;
							return;
						end;
					return;
				end;
			task.spawn(v22);
			v24.Space(v24);
			v22 = getgenv();
			v17 = getgenv();
			v22.eggCollectorRunning = v17.eggCollectorRunning or false;
			v21 = getgenv();
			egg_collector_running = v21.eggCollectorRunning;
			v17 = game:GetService("Players");
			v21 = tostring(v17.LocalPlayer.UserId);
			v21_ref = v21;
			v18 = function(arg1, arg2, arg3)
					local v0;
					local name = arg1.Name;
					local v35_ref_ref = v35_ref;
					local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
					local v1 = arg1.Name ~= "Collectable";
					if arg1.Name ~= "Collectable" then
						return;
					else
						v35_ref_ref = callback_fn_10_ref_3;
						callback_fn_10_ref_3_ref = 11011191149575;
						v1 = arg1:GetAttribute("ID");
						v0 = v1;
						name = v1;
						v1 = not v1;
						if not name then
							return;
						else
							callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							v1 = arg1:GetAttribute("AcceptedPlayers");
							v35_ref_ref = v1;
							name = v1;
							if v1 then
								callback_fn_10_ref_3("", 9650854826382);
							end;
							if name then
								callback_fn_10_ref_3_ref = string.find(v35_ref_ref, v21_ref);
								if not callback_fn_10_ref_3_ref then
									return;
								else
									callback_fn_10_ref_3_ref = function(arg1, arg2, arg3, arg4, arg5)
											local v0;
											local v1 = (getfenv and getfenv() or _ENV)[v0];
											v0.WaitForChild(v0, "RemoteEvents");
											v0.FireServer(v0, v0);
											return;
										end;
									tostring(arg1:GetAttribute("ItemId"));
									tostring(v0);
									return;
								end;
							end;
						end;
					end;
				end;
			v18_ref = v18;
			v30 = callback_fn_10_ref_3("", 27661038907984);
			callback_fn_9 = function(arg1, arg2, arg3, arg4)
					local items;
					egg_collector_running = arg1;
					if arg1 then
						items = { Title = "Egg Collector Started", Content = "Collecting available easter eggs...", Duration = 3 };
						callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, items);
						items = function(arg1, arg2, arg3, arg4)
								local v0;
								local args = { workspace:GetChildren() };
								for key, value in pairs((unpack or table.unpack)(args)) do
									while egg_collector_running do
										v18_ref(value);
										task.wait(.05);
									end;
									key = function(arg1, arg2, arg3, arg4, arg5, arg6)
											if not egg_collector_running then
												return;
											else
												return;
											end;
										end;
									v0 = workspace.ChildAdded:Connect(key);
									while egg_collector_running do
										task.wait(.5);
									end;
									v0.Disconnect(v0);
									print("[EGG COLLECTOR] Stopped and disconnected");
									return;
								end;
							end;
						task.spawn(items);
					else
						callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Egg Collector Stopped", Content = "Auto collection disabled", Duration = 2 });
					end;
					return;
				end;
			items_11 = {
					Flag = "EggCollector",
					Title = "Easter Eggs Auto Collector",
					Desc = v35_ref[v30],
					Default = false,
					Callback = callback_fn_9,
				};
			items_10 = v24:Toggle(items_11);
			items_11 = getgenv();
			items_11.EggCollectorToggle = items_10;
			v24.Space(v24);
			v31 = callback_fn_10_ref_3("", 27152505139555);
			callback_fn_8 = function(arg1)
					local v0;
					local v1 = (getfenv and getfenv() or _ENV)[v0];
					local callback_fn = function()
							local v35_ref_ref, v0;
							local args = { workspace.Map.ARGObby:GetDescendants() };
							for key, value in pairs((unpack or table.unpack)(args)) do
								v35_ref_ref = v35_ref;
								v0 = value.Name == "FireInteractionEvent";
								if value.Name == "FireInteractionEvent" then
									value.IsA(value, "RemoteEvent");
								end;
								while not v0 do
 
								end;
								value = nil;
								if nil then
									(nil).FireServer(nil);
									value = (nil):GetFullName();
									print("[ARG OBBY] \226\156\147 Portal activated via: " .. value);
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Obby", Content = "Obby activated!", Duration = 1 });
								else
									warn("Obby Remote not found!");
									v35_ref_ref = callback_fn_10_ref_3("", 33462131768542);
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Obby Failed", Content = v35_ref[v35_ref_ref], Duration = 1 });
								end;
								return;
							end;
						end;
					return;
				end;
			v17 = { Title = "Auto Obby", Desc = v35_ref[v31], Callback = callback_fn_8 };
			v24.Button(v24, v17);
			v24.Space(v24);
			callback_fn_4 = function(arg1, arg2)
					local callback_fn = function(arg1)
							local v35_ref_ref = v35_ref;
							local callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
							local n1 = 21285273577143;
							local game_gui = n3:FindFirstChild("GameGui");
							local game_gui_ref = game_gui;
							local v0 = not game_gui;
							if not game_gui then
								return VCfBPlEMXSYUQ7;
							else
								callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
								n1 = 5619331844664;
								game_gui = "CurrencyDisplay";
								v0 = game_gui_ref:FindFirstChild("CurrencyDisplay", true);
								v35_ref_ref = v0;
								v0 = not v0;
								if not (not (not (not (not (not (not v0)))))) then
									return H0sN6NBsoNm2E;
								else
									n1 = callback_fn_10_ref_3;
									game_gui = "SeedsDisplay";
									v0 = v35_ref_ref:FindFirstChild("SeedsDisplay");
									callback_fn_10_ref_3_ref = v0;
									v0 = not v0;
									if not (not (not (not (not (not (not v0)))))) then
										return AQB34DFToa5t;
									else
										v0 = callback_fn_10_ref_3_ref:FindFirstChild("Title");
										n1 = v0;
										game_gui = v0;
										if v0 then
											n1.IsA(n1, "TextLabel");
										end;
										if game_gui then
											game_gui = n1.Text:match("(%d+)");
											if game_gui then
												v0 = (getfenv and getfenv() or _ENV)[game_gui];
												return (unpack or table.unpack)(game_gui);
											else
												return UFUpoGxrZGdQFc;
											end;
										end;
									end;
								end;
							end;
						end;
					local v0 = pcall(callback_fn);
					if pcall(callback_fn) then
 
					end;
					return v0;
				end;
			flag = false;
			callback_fn_4_ref = callback_fn_4;
			v28 = callback_fn_10_ref_3("", 987696693707);
			callback_fn_7 = function(arg1, arg2)
					local v0, v1, items;
					flag = arg1;
					if arg1 then
						v0 = callback_fn_4_ref();
						v1 = v0 < 50;
						if v0 < 50 then
							items = { Title = "Not Enough Seeds", Content = "You need at least 50 seeds! Current: " .. v0, Duration = 3 };
							v1.Notify(v1, items);
							items = function(arg1)
									return;
								end;
							v1(items);
							return;
						else
							items = { Title = "Ralph Donate Started", Content = "Auto donating 50 seeds... Current seeds: " .. v0, Duration = 3 };
							callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, items);
							items = function(arg1, arg2, arg3, arg4, arg5)
									local v0, v1, callback_fn;
									while flag do
										while true do
											v1 = callback_fn_4_ref();
											v1 = v1;
											if v1 < 50 then
												break;
											end;
											callback_fn = function()
													local v35_ref_ref = v35_ref;
													local message = "Map";
													local map = workspace:FindFirstChild("Map");
													local map_ref = map;
													if map then
														v35_ref_ref = workspace.Map:FindFirstChild("BeggarItems");
														if v35_ref_ref then
															workspace.Map.BeggarItems.FindFirstChild(workspace.Map.BeggarItems, "Beggar");
														end;
													end;
													local map_ref_ref = map_ref;
													local v0 = not map_ref;
													if not map_ref then
														return;
													else
														message = callback_fn_10_ref_3;
														v0 = map_ref_ref:FindFirstChild("HumanoidRootPart");
														map = v0;
														v0 = not v0;
														if not (not (not (not (not (not (not v0)))))) then
															return;
														else
															v0 = map:FindFirstChild("Interact");
															message = v0;
															v0 = not v0;
															if not (not (not (not (not (not (not v0)))))) then
																return;
															else
																v0 = message:FindFirstChildOfClass("ProximityPrompt");
																v0 = not v0;
																if not (not (not (not (not (not (not v0)))))) then
																	return;
																else
																	return;
																end;
															end;
														end;
													end;
												end;
											pcall(callback_fn);
											task.wait(.1);
										end;
										callback_fn = function()
												return;
											end;
										task.spawn(callback_fn);
										callback_fn = { Title = "Ralph Donate Stopped", Content = "Not enough seeds to continue! (Current: " .. (v0  .. ")"), Duration = 4 };
										callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, callback_fn);
										print("[RALPH] \226\155\148 Stopped - Not enough seeds (" .. (v0  .. ")"));
										return;
									end;
								end;
							task.spawn(items);
							return;
						end;
					else
						callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Ralph Donate Stopped", Content = "Auto donation disabled", Duration = 2 });
					end;
				end;
			v24.Toggle(v24, {
				Flag = "RalphAutoDonate",
				Title = "Auto Donate Ralph",
				Desc = v35_ref[v28],
				Default = false,
				Callback = callback_fn_7,
			});
			callback_fn_6 = function(arg1)
					wait(.4);
					print("[ANTI BAN TAB] Loading content...");
					local items = { Title = "Anti Ban", TextSize = 16, TextTransparency = .3 };
					v25.Section(v25, items);
					v25.Space(v25);
					local v0 = getgenv();
					local v1 = tostring(v0.AntiBanConfig.PlacementOffset);
					local callback_fn = function(arg1, arg2, arg3)
							message_2();
							local v0 = getgenv();
							local items = { tostring(v0.AntiBanConfig.PlacementOffset) };
							return;
						end;
					items = {
							Flag = "PlacementOffset",
							Title = "Placement Offset",
							Desc = "Adds randomness to macro placements.",
							Type = "Input",
							Value = v1,
							Placeholder = "1.5",
							Callback = callback_fn,
						};
					v25.Input(v25, items);
					v25.Space(v25);
					local v2 = callback_fn_10_ref_3("", 5801640774285);
					local v3 = getgenv();
					local v4 = tostring(v3.AntiBanConfig.MatchesBeforeReturn);
					v0 = function(arg1, arg2, arg3)
							message_2();
							local v0 = getgenv();
							local items = { tostring(v0.AntiBanConfig.MatchesBeforeReturn) };
							return;
						end;
					v25.Input(v25, {
						Flag = "MatchesBeforeReturn",
						Title = "Matches Before Returning to Lobby",
						Desc = v35_ref[v2],
						Type = "Input",
						Value = v4,
						Placeholder = "100",
						Callback = v0,
					});
					v25.Space(v25);
					v4 = callback_fn_10_ref_3("", 25319929540110);
					callback_fn = getgenv();
					local callback_fn_2 = function(arg1, arg2)
							local callback_fn, v0;
							local v1 = arg1;
							message_2();
							if arg1 then
								callback_fn = function(arg1, arg2, arg3, arg4)
										return;
									end;
								return;
							else
								callback_fn = getgenv();
								callback_fn.AntiBanConfig.AutoReturnEnabled = v1;
								if v1 then
									v0 = getgenv();
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Return Enabled", Content = "Will return to lobby after " .. (v0.AntiBanConfig.MatchesBeforeReturn .. " matches"), Duration = 3 });
								else
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Auto Return Disabled", Content = "Farm will run indefinitely", Duration = 2 });
								end;
								return;
							end;
						end;
					local items_2 = {
							Flag = "EnableAutoReturn",
							Title = "Enable Auto Return",
							Desc = v35_ref[v4],
							Default = callback_fn.AntiBanConfig.AutoReturnEnabled,
							Callback = callback_fn_2,
						};
					local v5 = v25:Toggle(items_2);
					items_2 = getgenv();
					local v6 = getgenv();
					items_2.AntiBanToggles = v6.AntiBanToggles;
					r69 = getgenv();
					r69.AntiBanToggles.AutoReturn = v5;
					v25.Space(v25);
					callback_fn = callback_fn_10_ref_3("", 13166551537651);
					v0 = function(arg1)
							local v0 = getgenv();
							local anti_ban_config = v0.AntiBanConfig;
							local n1 = 34685155327767;
							v0 = arg1;
							anti_ban_config.AntiAFKEnabled = arg1;
							if arg1 then
								n1 = getgenv();
								v0 = n1.AntiBanConfig;
								if not n1.AntiBanConfig.AntiAFKLoaded then
									v0 = function()
											local v0;
											local v1 = (getfenv and getfenv() or _ENV)[v0];
											local callback_fn = function()
													local v0;
													local items = { game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn") };
													v0();
													local v1 = v0();
													v1[v0][v0] = true;
													return;
												end;
											return;
										end;
									task.spawn(v0);
								end;
								v0 = { Title = "Anti-AFK Enabled", Content = "You won\'t be kicked for being AFK", Duration = 3 };
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, v0);
							else
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Anti-AFK Disabled", Content = "Anti-AFK protection disabled (requires rejoin to fully disable)", Duration = 3 });
							end;
							return;
						end;
					r8 = {
							Flag = "EnableAntiAFK",
							Title = "Enable Anti-AFK",
							Desc = v35_ref[callback_fn],
							Default = false,
							Callback = v0,
						};
					r69 = v25:Toggle(r8);
					local v7 = getgenv();
					v7.AntiBanToggles.AntiAFK = r69;
					print("[ANTI BAN TAB] Content loaded!");
					return;
				end;
			task.spawn(callback_fn_6);
			callback_fn_6 = function(arg1, arg2, arg3, arg4)
					local v0, message, v1, callback_fn_10_ref_3_ref;
					while true do
						v0 = task.wait(2);
						if not v0 then
							break;
						end;
						message_2();
						v1 = getgenv();
						v0 = v1.AntiBanConfig;
						v1 = v35_ref;
						callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
						message = "AutoReturnEnabled";
						if v0.AutoReturnEnabled then
							message = getgenv();
							message.AntiBanConfig.AutoReturnEnabled = false;
							callback_fn_10_ref_3_ref = getgenv();
							v1 = "AntiBanToggles";
							v0 = callback_fn_10_ref_3_ref.AntiBanToggles;
							if callback_fn_10_ref_3_ref.AntiBanToggles then
								getgenv();
							end;
							if v0 then
								v1 = getgenv();
								v1.AntiBanToggles.AutoReturn.Set(v1.AntiBanToggles.AutoReturn, false);
							end;
							print("[AUTO RETURN] \226\155\148 Disabled - Detected in lobby");
						end;
					end;
					return;
				end;
			task.spawn(callback_fn_6);
			callback_fn_6 = function(arg1, arg2, arg3, arg4, arg5)
					callback_fn_10_ref_3("", 6735704542272);
					callback_fn_10_ref_3("", 831269683587);
					getgenv();
					callback_fn_10_ref_3("", 18722426266126);
					local callback_fn = function(arg1)
							local v0 = getgenv();
							v0.WebhookConfig.URL = arg1;
							items_14();
							local v1 = callback_fn_10_ref_3("", 4211790923689);
							if arg1 ~= v35_ref[v1] then
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Webhook Saved", Content = "Stats will be sent automatically after each match", Duration = 3 });
							else
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Webhook Removed", Content = "Webhook notifications disabled", Duration = 2 });
							end;
							return;
						end;
					local callback_fn_2 = function(arg1, arg2, arg3, arg4, arg5)
							local v0 = getgenv();
							local url = v0.WebhookConfig.URL;
							local v1 = callback_fn_10_ref_3("", 12584810551012);
							if v0.WebhookConfig.URL == v35_ref[v1] then
								return;
							else
								url = v2_ref(nil, true);
								if url then
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Test Sent", Content = "Check your Discord Channel!", Duration = 3 });
								end;
								return;
							end;
						end;
					return;
				end;
			task.spawn(callback_fn_6);
			callback_fn_6 = function(arg1, arg2, arg3, arg4)
					wait(.6);
					print("[SETTINGS TAB] Loading content...");
					v26.Section(v26, { Title = "Configuration System", TextSize = 16, TextTransparency = .3 });
					v26.Space(v26);
					local callback_fn = function(arg1)
							local items, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27;
							local v28 = arg1;
							local v29 = not arg1;
							if not (not arg1) then
								callback_fn_10_ref_3("", 3779152037599);
							end;
							if v29 then
								return p3OyVMu5Q9oqQ;
							else
								v0 = getgenv();
								v2 = getgenv();
								v1 = getgenv();
								v10 = getgenv();
								v11 = getgenv();
								v15 = getgenv();
								v6 = getgenv();
								v13 = getgenv();
								v16 = getgenv();
								v5 = getgenv();
								v7 = getgenv();
								v17 = getgenv();
								v19 = getgenv();
								v18 = getgenv();
								v12 = getgenv();
								v25 = getgenv();
								v20 = v25.AutoFarmConfig.SpaceV2Active or false;
								v25 = getgenv();
								v14 = getgenv();
								v26 = getgenv();
								v9 = getgenv();
								v21 = getgenv();
								v24 = getgenv();
								v23 = getgenv();
								v22 = getgenv();
								v27 = getgenv();
								v8 = getgenv();
								v4 = getgenv();
								items = {
										MainTab_AutoSkip = v0.MainTabConfig.AutoSkip,
										MainTab_AutoSpeed2x = v2.MainTabConfig.AutoSpeed2x,
										MainTab_AutoSpeed3x = v1.MainTabConfig.AutoSpeed3x,
										MainTab_AutoPlayAgain = v10.MainTabConfig.AutoPlayAgain,
										MainTab_AutoReturn = v11.MainTabConfig.AutoReturn,
										MainTab_AutoDifficulty = v15.MainTabConfig.AutoDifficulty,
										MainTab_AutoJoinMap = v6.MainTabConfig.AutoJoinMap,
										MainTab_SelectedDifficulty = v13.MainTabConfig.SelectedDifficulty,
										MainTab_SelectedDifficultyName = v16.MainTabConfig.SelectedDifficultyName,
										MainTab_SelectedMap = v5.MainTabConfig.SelectedMap,
										MainTab_SelectedMapName = v7.MainTabConfig.SelectedMapName,
										AutoFarm_GraveyardV1Active = v17.AutoFarmConfig.GraveyardV1Active,
										AutoFarm_GraveyardV2Active = v19.AutoFarmConfig.GraveyardV2Active,
										AutoFarm_WinterActive = v18.AutoFarmConfig.WinterActive,
										AutoFarm_SpaceV1Active = v12.AutoFarmConfig.SpaceV1Active or false,
										AutoFarm_SpaceV2Active = v20,
										AutoFarm_DojoActive = v25.AutoFarmConfig.DojoActive,
										AutoFarm_AutoWinV1Active = v14.AutoFarmConfig.AutoWinV1Active,
										AutoFarm_AutoWinV2Active = v26.AutoFarmConfig.AutoWinV2Active,
										AntiBan_PlacementOffset = v9.AntiBanConfig.PlacementOffset,
										AntiBan_MatchesBeforeReturn = v21.AntiBanConfig.MatchesBeforeReturn,
										AntiBan_AutoReturnEnabled = v24.AntiBanConfig.AutoReturnEnabled,
										AntiBan_AntiAFKEnabled = v23.AntiBanConfig.AntiAFKEnabled,
										Performance_RenderStopped = v22.PerformanceConfig.RenderStopped,
										Performance_BlackScreenEnabled = v27.PerformanceConfig.BlackScreenEnabled,
										Performance_LowGraphicsEnabled = v8.LowGraphicsConfig.Enabled,
										Webhook_URL = v4.WebhookConfig.URL,
										Misc_EggCollectorEnabled = egg_collector_running,
									};
								v3 = isfolder("NoahScriptHub");
								if not v3 then
									makefolder("NoahScriptHub");
								end;
								v3 = isfolder("NoahScriptHub/Configs");
								v29 = not v3;
								if not v3 then
									makefolder("NoahScriptHub/Configs");
								end;
								v3 = function(arg1)
										local v0;
										v0.JSONEncode(v0, items);
										return;
									end;
								v28 = v29(v3);
								return v28;
							end;
						end;
					local callback_fn_ref = callback_fn;
					callback_fn = function(arg1)
							local v0, n1, v1, message, callback_fn_10_ref_3_ref, n2, v2, n3, v3, v4, v5;
							local v6 = arg1;
							local v7 = not arg1;
							if not (not arg1) then
								callback_fn_10_ref_3("", 22903212059049);
							end;
							if v7 then
								return QzaFERmCHZaF;
							else
								n1 = 20616333747584;
								message = "=\200Hi\245";
								callback_fn_10_ref_3_ref = callback_fn_10_ref_3;
								n2 = 20616333747584;
								v0 = "NoahScriptHub/Configs/" .. (v6  .. ".json");
								v7 = isfile;
								v1 = "NoahScriptHub/Configs/" .. (v6  .. ".json");
								v2 = isfile("NoahScriptHub/Configs/" .. (v6  .. ".json"));
								if not v2 then
									return TiUyqyfeUctSq;
								else
									v1 = function(arg1, arg2)
											local unpack_fn_7 = unpack or table.unpack;
											local v0;
											local items = { readfile(v0) };
											local items_2 = { v0:JSONDecode(unpack_fn_7(items)) };
											return unpack_fn_7(aKHccoNC4RYru);
										end;
									callback_fn_10_ref_3_ref = { pcall(v1) };
									v2 = callback_fn_10_ref_3_ref[2];
									callback_fn_10_ref_3_ref = not callback_fn_10_ref_3_ref[1];
									v7 = not (not (not (not (not (not callback_fn_10_ref_3_ref[1])[1])[1])[1])[1])[1];
									if not (not (not (not (not (not (not callback_fn_10_ref_3_ref[1])[1])[1])[1])[1])[1])[1] then
										return nil;
									else
										callback_fn_10_ref_3_ref = getgenv();
										callback_fn_10_ref_3_ref.MainTabConfig.AutoSkip = v2.MainTab_AutoSkip or false;
										n2 = getgenv();
										n2.MainTabConfig.AutoSpeed2x = v2.MainTab_AutoSpeed2x or false;
										n2 = getgenv();
										n2.MainTabConfig.AutoSpeed3x = v2.MainTab_AutoSpeed3x or false;
										n2 = getgenv();
										n2.MainTabConfig.AutoPlayAgain = v2.MainTab_AutoPlayAgain or false;
										n2 = getgenv();
										n2.MainTabConfig.AutoReturn = v2.MainTab_AutoReturn or false;
										n2 = getgenv();
										n2.MainTabConfig.AutoDifficulty = v2.MainTab_AutoDifficulty or false;
										n2 = getgenv();
										n2.MainTabConfig.AutoJoinMap = v2.MainTab_AutoJoinMap or false;
										n2 = getgenv();
										n2.MainTabConfig.SelectedDifficulty = v2.MainTab_SelectedDifficulty;
										n2 = getgenv();
										n2.MainTabConfig.SelectedDifficultyName = v2.MainTab_SelectedDifficultyName;
										n2 = getgenv();
										n2.MainTabConfig.SelectedMap = v2.MainTab_SelectedMap;
										n2 = getgenv();
										n2.MainTabConfig.SelectedMapName = v2.MainTab_SelectedMapName;
										n2 = getgenv();
										n2.AutoFarmConfig.GraveyardV1Active = v2.AutoFarm_GraveyardV1Active or false;
										n2 = getgenv();
										n2.AutoFarmConfig.GraveyardV2Active = v2.AutoFarm_GraveyardV2Active or false;
										n2 = getgenv();
										n2.AutoFarmConfig.WinterActive = v2.AutoFarm_WinterActive or false;
										n2 = getgenv();
										n2.AutoFarmConfig.SpaceV1Active = v2.AutoFarm_SpaceV1Active or false;
										n2 = getgenv();
										n2.AutoFarmConfig.SpaceV2Active = v2.AutoFarm_SpaceV2Active or false;
										n2 = getgenv();
										n2.AutoFarmConfig.DojoActive = v2.AutoFarm_DojoActive or false;
										n2 = getgenv();
										n2.AutoFarmConfig.AutoWinV1Active = v2.AutoFarm_AutoWinV1Active or false;
										n2 = getgenv();
										n2.AutoFarmConfig.AutoWinV2Active = v2.AutoFarm_AutoWinV2Active or false;
										n2 = getgenv();
										n2.AntiBanConfig.PlacementOffset = v2.AntiBan_PlacementOffset or 1.5;
										n2 = getgenv();
										n2.AntiBanConfig.MatchesBeforeReturn = v2.AntiBan_MatchesBeforeReturn or 100;
										n2 = getgenv();
										n2.AntiBanConfig.AutoReturnEnabled = v2.AntiBan_AutoReturnEnabled or false;
										n2 = getgenv();
										n2.AntiBanConfig.AntiAFKEnabled = v2.AntiBan_AntiAFKEnabled or false;
										n2 = getgenv();
										n2.PerformanceConfig.RenderStopped = v2.Performance_RenderStopped or false;
										n2 = getgenv();
										n2.PerformanceConfig.BlackScreenEnabled = v2.Performance_BlackScreenEnabled or false;
										n2 = getgenv();
										n2.LowGraphicsConfig.Enabled = v2.Performance_LowGraphicsEnabled or false;
										n2 = getgenv();
										v7 = n2.WebhookConfig;
										callback_fn_10_ref_3_ref = "URL";
										n2 = v2.Webhook_URL;
										if not v2.Webhook_URL then
											callback_fn_10_ref_3("", 26964626305292);
										end;
										v7[callback_fn_10_ref_3_ref] = n2;
										egg_collector_running = v2.Misc_EggCollectorEnabled or false;
										n2 = getgenv();
										n2.eggCollectorRunning = v2.Misc_EggCollectorEnabled or false;
										message = getgenv();
										if message.EggCollectorToggle then
											message = getgenv();
											message.EggCollectorToggle.Set(message.EggCollectorToggle, egg_collector_running);
										end;
										n1 = getgenv();
										n2 = n1.MainTabToggles;
										n1 = v35_ref;
										n3 = 1871061369703;
										if n2.AutoSkip then
											n1 = getgenv();
											n3 = getgenv();
											n1.MainTabToggles.AutoSkip.Set(n1.MainTabToggles.AutoSkip, n3.MainTabConfig.AutoSkip);
										end;
										n1 = getgenv();
										n2 = n1.MainTabToggles;
										n1 = v35_ref;
										n3 = 34225038589505;
										if n2.AutoSpeed2x then
											n1 = getgenv();
											n3 = getgenv();
											n1.MainTabToggles.AutoSpeed2x.Set(n1.MainTabToggles.AutoSpeed2x, n3.MainTabConfig.AutoSpeed2x);
										end;
										n1 = getgenv();
										n2 = n1.MainTabToggles;
										n1 = v35_ref;
										n3 = 686963736895;
										if n2.AutoSpeed3x then
											n1 = getgenv();
											n3 = getgenv();
											n1.MainTabToggles.AutoSpeed3x.Set(n1.MainTabToggles.AutoSpeed3x, n3.MainTabConfig.AutoSpeed3x);
										end;
										n1 = getgenv();
										n2 = n1.MainTabToggles;
										n1 = v35_ref;
										n3 = 32763229191064;
										if n2.AutoPlayAgain then
											n1 = getgenv();
											n3 = getgenv();
											n1.MainTabToggles.AutoPlayAgain.Set(n1.MainTabToggles.AutoPlayAgain, n3.MainTabConfig.AutoPlayAgain);
										end;
										n1 = getgenv();
										n2 = n1.MainTabToggles;
										n1 = v35_ref;
										n3 = 19576055374747;
										if n2.AutoDifficulty then
											n1 = getgenv();
											n3 = getgenv();
											n1.MainTabToggles.AutoDifficulty.Set(n1.MainTabToggles.AutoDifficulty, n3.MainTabConfig.AutoDifficulty);
										end;
										n1 = getgenv();
										n2 = n1.MainTabToggles;
										n1 = v35_ref;
										n3 = 28343041454990;
										if n2.AutoJoinMap then
											n1 = getgenv();
											n3 = getgenv();
											n1.MainTabToggles.AutoJoinMap.Set(n1.MainTabToggles.AutoJoinMap, n3.MainTabConfig.AutoJoinMap);
										end;
										n1 = getgenv();
										n2 = n1.AntiBanToggles;
										n1 = v35_ref;
										n3 = 21688991573875;
										if n2.AntiAFK then
											n1 = getgenv();
											n3 = getgenv();
											n1.AntiBanToggles.AntiAFK.Set(n1.AntiBanToggles.AntiAFK, n3.AntiBanConfig.AntiAFKEnabled);
										end;
										message = getgenv();
										n3 = 34135251729943;
										if message.PerformanceModeToggle then
											message = getgenv();
											n3 = getgenv();
											message.PerformanceModeToggle.Set(message.PerformanceModeToggle, n3.PerformanceConfig.RenderStopped);
										end;
										message = getgenv();
										n3 = 34864651796331;
										if message.BlackScreenToggle then
											message = getgenv();
											n3 = getgenv();
											message.BlackScreenToggle.Set(message.BlackScreenToggle, n3.PerformanceConfig.BlackScreenEnabled);
										end;
										message = getgenv();
										n3 = 31992911428145;
										if message.LowGraphicsToggle then
											message = getgenv();
											n3 = getgenv();
											message.LowGraphicsToggle.Set(message.LowGraphicsToggle, n3.LowGraphicsConfig.Enabled);
										end;
										v4 = nil;
										v3 = nil;
										if nil then
											v5 = getgenv();
											if v5.AutoFarmToggles then
												getgenv();
											end;
										end;
										if v3 then
											v4 = function(arg1, arg2, arg3, arg4)
													getgenv();
													return;
												end;
											task.spawn(v4);
										end;
										return true;
									end;
								end;
							end;
						end;
					local callback_fn_ref_2 = callback_fn;
					callback_fn = function(arg1, arg2, arg3, arg4, arg5, arg6)
							local v0;
							local v1 = arg1;
							local v2 = not arg1;
							if not (not arg1) then
								callback_fn_10_ref_3("", 25025204596101);
							end;
							if v2 then
								return gyff8OkVjaYL8;
							else
								v2 = isfile;
								v0 = isfile("NoahScriptHub/Configs/" .. (v1  .. ".json"));
								if not v0 then
									return A6fOSOlLSHlFE;
								else
									v0 = function(arg1)
											return;
										end;
									v2 = pcall(v0);
									v0 = v2;
									if not v2 then
										warn("[SETTINGS] \226\156\151 Failed to delete config: " .. v1);
									end;
									return v0;
								end;
							end;
						end;
					local callback_fn_ref_3 = callback_fn;
					callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local v0;
							local v1 = isfolder("NoahScriptHub/Configs");
							if not v1 then
								return Mjv5ELTveYZ2;
							else
								r83 = function()
										local n1;
										local pairs_fn = pairs;
										local args = { listfiles("NoahScriptHub/Configs") };
										for key, value in pairs((unpack or table.unpack)(args)) do
											n1 = 5202844207478;
											callback_fn_10_ref_3(27907785880259, 5202844207478);
											pairs_fn = value:match(v35_ref);
											if pairs_fn then
												n1 = (27907785880259)("D\200\";$\\", 31262102501597);
												callback_fn_10_ref_3[("\232UM\015\170\216J\154\134\205\210\215\172\174\216\223a\169\169\219}")[n1]](v0, v35_ref);
											end;
										end;
										return;
									end;
								return F3R059LVrCKlKf;
							end;
						end;
					local callback_fn_ref_4 = callback_fn;
					callback_fn = function(arg1)
							local v0 = isfolder;
							local v1 = isfolder("NoahScriptHub");
							if not v1 then
								makefolder("NoahScriptHub");
							end;
							v1 = function(arg1)
									local v0;
									local v1 = (getfenv and getfenv() or _ENV)[v0];
									return;
								end;
							return v0;
						end;
					local callback_fn_ref_5 = callback_fn;
					callback_fn = function(arg1, arg2, arg3, arg4, arg5)
							local v0 = isfile;
							local v35_ref_ref = v35_ref;
							local message = "NoahScriptHub/AutoLoad.txt";
							local v1 = isfile("NoahScriptHub/AutoLoad.txt");
							if not v1 then
								return xj27eeZC2n9H9a;
							else
								message = function(arg1, arg2)
										local args;
										local v0 = (getfenv and getfenv() or _ENV)[args];
										return (unpack or table.unpack)(args);
									end;
								v35_ref_ref = { pcall(message) };
								v1 = v35_ref_ref[2];
								v0 = v35_ref_ref[1];
								if v35_ref_ref[1] then
									if v1 then
										callback_fn_10_ref_3("", 15404498803717);
									end;
								end;
								return v0;
							end;
						end;
					local callback_fn_ref_6 = callback_fn;
					callback_fn = function()
							local v0 = isfile;
							local v1 = isfile("NoahScriptHub/AutoLoad.txt");
							if not v1 then
								return shC6PpUfB0NTYo;
							else
								v1 = function(arg1, arg2, arg3, arg4, arg5)
										local v0;
										local v1 = (getfenv and getfenv() or _ENV)[v0];
										return;
									end;
								return v0;
							end;
						end;
					local callback_fn_ref_7 = callback_fn;
					local v0 = nil;
					local v1 = nil;
					local v2 = nil;
					local v3 = callback_fn_10_ref_3("", 26355939258352);
					local v4 = callback_fn_10_ref_3("", 17953855414440);
					local callback_fn_2 = function(arg1, arg2)
							local v0 = callback_fn_10_ref_3("", 8800585601026);
							if arg1 ~= v35_ref[v0] then
								v1.Highlight(v1);
							end;
							return;
						end;
					local v5 = v26:Input({
							Flag = "NewConfigName",
							Title = "Config Name",
							Desc = v35_ref[v3],
							Type = "Input",
							Placeholder = v35_ref[v4],
							Callback = callback_fn_2,
						});
					v1 = v5;
					v26.Space(v26);
					callback_fn = function(arg1, arg2)
							local v0 = callback_fn_ref_4();
							local items = {};
							for _, value in ipairs(v0) do
								table.insert(items, { Title = value });
							end;
							if v0 then
								v0.Refresh(v0, items);
							end;
							return;
						end;
					local callback_fn_ref_8 = callback_fn;
					local items = {};
					local callback_fn_3 = function(arg1, arg2, arg3)
							if arg1.Title ~= "No configs saved" then
								v0.Highlight(v0);
								print("[SETTINGS] Selected config: " .. arg1.Title);
							end;
							return;
						end;
					local items_2 = {
							Flag = "ConfigList",
							Title = "Config List",
							Values = items,
							Callback = callback_fn_3,
						};
					local v6 = v26:Dropdown(items_2);
					v0 = v6;
					callback_fn();
					v26.Space(v26);
					callback_fn_3 = callback_fn_10_ref_3("", 12695950006040);
					v3 = function(arg1, arg2, arg3)
							local value = v1.Value;
							local v0 = not v1.Value;
							if not (not v1.Value) then
								callback_fn_10_ref_3("", 23159160875552);
							end;
							if v0 then
								return;
							else
								v0 = callback_fn_ref(value);
								if v0 then
									callback_fn_ref_8();
									v0.Select(v0, value);
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Config Created", Content = "\'" .. (value .. "\' saved successfully!"), Duration = 3 });
									print("[SETTINGS] Config \'" .. (value .. "\' created"));
								else
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Save Failed", Content = "Failed to save configuration", Duration = 3 });
								end;
								return;
							end;
						end;
					local items_3 = { Title = "Create Config", Desc = v35_ref[callback_fn_3], Callback = v3 };
					v26.Button(v26, items_3);
					v26.Space(v26);
					callback_fn_3 = callback_fn_10_ref_3("", 28252477092708);
					v3 = function()
							local v0 = type(v0.Value);
							local v1 = nil;
							local v2 = tostring(nil);
							print("[SETTINGS] Delete button pressed. Selected: " .. v2);
							local v3 = v0 == "table";
							local flag = true;
							v0 = true;
							if v0 then
								callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Error", Content = "Please select a config to delete!", Duration = 3 });
								return;
							else
								flag = "[SETTINGS] Attempting to delete: " .. v1;
								print("[SETTINGS] Attempting to delete: " .. v1);
								v3 = callback_fn_ref_3(v1);
								if v3 then
									print("[SETTINGS] \226\156\147 Delete successful, refreshing dropdown...");
									task.wait(.1);
									callback_fn_ref_8();
									flag = callback_fn_ref_6();
									if flag == v1 then
										callback_fn_ref_7();
										if v2 then
											v2.SetDesc(v2, "Load selected config on startup");
										end;
										print("[SETTINGS] Autoload removed because config was deleted");
									end;
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Config Deleted", Content = "\'" .. (v1  .. "\' has been deleted!"), Duration = 3 });
									print("[SETTINGS] \226\156\147 Config deleted: " .. v1);
								else
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Delete Failed", Content = "Config \'" .. (v1  .. "\' not found!"), Duration = 3 });
									warn("[SETTINGS] \226\156\151 Failed to delete: " .. v1);
								end;
								return;
							end;
						end;
					items_3 = { Title = "Delete Config", Desc = v35_ref[callback_fn_3], Callback = v3 };
					v26.Button(v26, items_3);
					v26.Space(v26);
					callback_fn_3 = callback_fn_10_ref_3("", 33202332417125);
					v3 = function(arg1, arg2)
							local v0 = type(v0.Value);
							r83 = v0 == "table";
							ret_reg = not (v0 == "table");
							if not (v0 == "table") then
								return;
							else
								ret_reg = callback_fn_ref_2(r83);
								if ret_reg then
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Config Loaded", Content = "\'" .. (r83  .. "\' loaded successfully!"), Duration = 3 });
									print("[SETTINGS] Config \'" .. (r83  .. "\' loaded"));
								else
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Load Failed", Content = "Failed to load \'" .. (r83  .. "\'"), Duration = 3 });
								end;
								return;
							end;
						end;
					items_3 = { Title = "Load Config", Desc = v35_ref[callback_fn_3], Callback = v3 };
					v26.Button(v26, items_3);
					v26.Space(v26);
					callback_fn_3 = callback_fn_10_ref_3("", 7890380754522);
					v3 = function(arg1, arg2, arg3, arg4, arg5)
							local v0 = type(v0.Value);
							r83 = v0 == "table";
							ret_reg = not (v0 == "table");
							if not (v0 == "table") then
								return;
							else
								ret_reg = callback_fn_ref(r83);
								if ret_reg then
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Config Overwritten", Content = "\'" .. (r83  .. "\' updated successfully!"), Duration = 3 });
									print("[SETTINGS] Config \'" .. (r83  .. "\' overwritten"));
								else
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Overwrite Failed", Content = "Failed to overwrite configuration", Duration = 3 });
								end;
								return;
							end;
						end;
					items_3 = { Title = "Overwrite Config", Desc = v35_ref[callback_fn_3], Callback = v3 };
					v26.Button(v26, items_3);
					v26.Space(v26);
					callback_fn_3 = callback_fn_10_ref_3("", 15592391269468);
					v3 = function(arg1, arg2, arg3, arg4)
							return;
						end;
					items_3 = { Title = "Refresh List", Desc = v35_ref[callback_fn_3], Callback = v3 };
					v26.Button(v26, items_3);
					v26.Space(v26);
					items_2 = callback_fn_ref_6();
					local message = "Title";
					local text = "Set as Autoload";
					v3 = v26;
					local message_2 = "Desc";
					items = items_2;
					if not items_2 then
						callback_fn_10_ref_3("", 14651465456294);
					end;
					callback_fn_3 = function(arg1, arg2, arg3, arg4)
							local v0 = type(v0.Value);
							r83 = v0 == "table";
							ret_reg = not (v0 == "table");
							if not (v0 == "table") then
								return;
							else
								ret_reg = callback_fn_ref_5(r83);
								if ret_reg then
									v2.SetDesc(v2, "Current: \'" .. (r83  .. "\'"));
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Autoload Set", Content = "\'" .. (r83  .. "\' will load on startup"), Duration = 3 });
									print("[SETTINGS] Autoload set to: " .. r83);
								else
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Failed", Content = "Failed to set autoload", Duration = 3 });
								end;
								return;
							end;
						end;
					items_3 = v3:Button({ [message] = text, [message_2] = items, Callback = callback_fn_3 });
					v2 = items_3;
					v26.Space(v26);
					callback_fn_2 = callback_fn_10_ref_3("", 15217651571630);
					local callback_fn_4 = function(arg1, arg2, arg3, arg4, arg5)
							local v0 = callback_fn_ref_6();
							if not v0 then
								return;
							else
								v0 = callback_fn_ref_7();
								if v0 then
									v2.SetDesc(v2, "Load selected config on startup");
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Autoload Removed", Content = "Autoload disabled", Duration = 3 });
									print("[SETTINGS] Autoload removed");
								else
									callback_fn_10_ref_2.Notify(callback_fn_10_ref_2, { Title = "Failed", Content = "Failed to remove autoload", Duration = 3 });
								end;
								return;
							end;
						end;
					message = { Title = "Remove Autoload", Desc = v35_ref[callback_fn_2], Callback = callback_fn_4 };
					v26.Button(v26, message);
					print("[SETTINGS TAB] Content loaded successfully!");
					return;
				end;
			task.spawn(callback_fn_6);
			return;
		end;
	end;
end;
